import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/feed.dart';

class FeedService {
  static Firestore _firestore = locator<Firestore>();

  static CollectionReference _feedRef = _firestore.collection("feed");

  final StreamController<List<Feed>> _feedController =
      StreamController<List<Feed>>.broadcast();

  static const int FeedItemLimit = 10;

  DocumentSnapshot _lastFeed;

  List<List<Feed>> _allFeedResults = List<List<Feed>>();

  bool _hasMoreFeedItems = true;

  final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();

  Stream listenToFeedRealTime() {
    _requestFeedItems();
    return _feedController.stream;
  }

  void _requestFeedItems() {
    var feedQuery = _feedRef
        .orderBy('timeStamp')
        .where("timeStamp", isGreaterThanOrEqualTo: timeStamp)
        .limit(FeedItemLimit);

    if (_lastFeed != null) {
      feedQuery = feedQuery.startAfterDocument(_lastFeed);
    }

    if (!_hasMoreFeedItems) return;

    var currentRequestIndex = _allFeedResults.length;

    feedQuery.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var feedItems = postsSnapshot.documents
            .map((snapshot) => Feed.fromDocumentSnapShot(snapshot))
            .where((mappedItem) => mappedItem.title != null)
            .toList();

        var pageExists = currentRequestIndex < _allFeedResults.length;

        if (pageExists) {
          _allFeedResults[currentRequestIndex] = feedItems;
        } else {
          _allFeedResults.add(feedItems);
        }

        var allPosts = _allFeedResults.fold<List<Feed>>(List<Feed>(),
            (initialValue, pageItems) => initialValue..addAll(pageItems));

        _feedController.add(allPosts);

        if (currentRequestIndex == _allFeedResults.length - 1) {
          _lastFeed = postsSnapshot.documents.last;
        }

        _hasMoreFeedItems = feedItems.length == FeedItemLimit;
      }
    });
  }

  void requestMoreData() => _requestFeedItems();
}
