import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/models/feed.dart';
import 'package:svuce_app/models/user.dart';

class FirestoreService {
  final CollectionReference _userColletionReference =
      Firestore.instance.collection("users");

  final CollectionReference _feedColletionReference =
      Firestore.instance.collection('feed');
    
  final StreamController<List<Feed>> _feedController =
      StreamController<List<Feed>>.broadcast();
  
  static const int FeedItemLimit = 10;

  DocumentSnapshot _lastFeed;

  List<List<Feed>> _allFeedResults = List<List<Feed>>();

  bool _hasMoreFeedItems = true;

  Future createUser(User user) async {
    try {
      await _userColletionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _userColletionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e?.message;
    }
  }

  Future isRollNoExists(String rollNo) async {
    try {
      var result = await _userColletionReference
          .where("rollNo", isEqualTo: rollNo)
          .getDocuments();

      if (result.documents != null) {
        return result.documents.isNotEmpty;
      }

      return false;
    } catch (e) {
      return e?.message;
    }
  }

  
  Stream listenToFeedRealTime() {
    _requestFeedItems();
    return _feedController.stream;
  }

  void _requestFeedItems() {
    var feedQuery =
        _feedColletionReference.orderBy('timeStamp').limit(FeedItemLimit);

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
