import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/feed/feed.dart';
import 'package:svuce_app/core/repositories/feed_repository/feed_repository.dart';

@Singleton(as: FeedRepository)
class FeedRepositoryImpl implements FeedRepository {
  final log = getLogger("Feed Repository Impl");
  static FirebaseFirestore firestore = locator<FirebaseFirestore>();

  static CollectionReference _feedRef = firestore.collection("feed");

  final StreamController<List<Feed>> _feedController =
      StreamController<List<Feed>>.broadcast();

  static const int FeedItemLimit = 10;

  DocumentSnapshot _lastFeed;

  List<List<Feed>> _allFeedResults = [];

  bool _hasMoreFeedItems = true;

  final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();

  initFeedMode() {
    _hasMoreFeedItems = true;
  }

  void _requestFeedItems() {
    var feedQuery = _feedRef
        .orderBy('timeStamp', descending: true)
        .where("timeStamp", isGreaterThanOrEqualTo: timeStamp)
        .limit(FeedItemLimit);

    if (_lastFeed != null) {
      feedQuery = feedQuery.startAfterDocument(_lastFeed);
    }
    log.i("Has More Feed Data is:$_hasMoreFeedItems");
    if (!_hasMoreFeedItems) return;

    var currentRequestIndex = _allFeedResults.length;

    feedQuery.snapshots().listen((postsSnapshot) {
      var feedItems = postsSnapshot.docs
          .map((snapshot) => Feed.fromDocument(snapshot))
          .where((mappedItem) => mappedItem.title != null)
          .toList();

      var pageExists = currentRequestIndex < _allFeedResults.length;

      if (pageExists) {
        _allFeedResults[currentRequestIndex] = feedItems;
      } else {
        _allFeedResults.add(feedItems);
      }

      var allPosts = _allFeedResults.fold<List<Feed>>(
          [], (initialValue, pageItems) => initialValue..addAll(pageItems));

      _feedController.add(allPosts);

      if (currentRequestIndex == _allFeedResults.length - 1) {
        if (postsSnapshot.docs.length != 0)
          _lastFeed = postsSnapshot.docs?.last;
      }

      _hasMoreFeedItems = feedItems.length == FeedItemLimit;
    });
  }

  @override
  Stream getFeed() {
    _requestFeedItems();
    return _feedController.stream;
  }

  @override
  void requestMoreData() => _requestFeedItems();

  @override
  createPost({Feed feed}) async {
    try {
      await _feedRef.add(feed.toJson());
      return true;
    } catch (e) {
      return false;
    }
    //?Todo Add Snackbar
  }

  @override
  deletePost({Feed feed}) async {
    try {
      await _feedRef.doc(feed.id).delete();
      log.i("Delete Post Successfully");
      return true;
    } catch (e) {
      return false;
    }
    //?Todo Add Snackbar
  }

  @override
  updatePost({Feed feed}) async {
    try {
      await _feedRef.doc(feed.id).update(feed.toJson());
      log.i("Updated Post Successfully");

      return true;
    } catch (e) {
      return false;
    }
    //?Todo Add Update Snackbar
  }
}
