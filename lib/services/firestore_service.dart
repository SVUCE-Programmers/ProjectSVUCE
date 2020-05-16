import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/models/annnouncement.dart';
import 'package:svuce_app/models/club.dart';
import 'package:svuce_app/models/feed.dart';
import 'package:svuce_app/models/event.dart';
import 'package:svuce_app/models/user.dart';

@lazySingleton
class FirestoreService {
  final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();

  final CollectionReference _userColletionReference =
      Firestore.instance.collection("users");

  final CollectionReference _feedColletionReference =
      Firestore.instance.collection('feed');

  final CollectionReference _clubsColletionReference =
      Firestore.instance.collection('clubs');

  final CollectionReference _eventColletionReference =
      Firestore.instance.collection('events');

  final CollectionReference _announcementsCollectionReference=
      Firestore.instance.collection("announcements");

  final StreamController<List<Feed>> _feedController =
      StreamController<List<Feed>>.broadcast();

  final StreamController<List<Announcement>> _announceController =
      StreamController<List<Announcement>>.broadcast();

  final StreamController<List<Club>> _clubStreamController =
      StreamController<List<Club>>.broadcast();

  final StreamController<Event> _upcomingController =
      StreamController<Event>.broadcast();

  final StreamController<List<Event>> _eventController =
      StreamController<List<Event>>.broadcast();

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

  void _requestEventsData() {
    var eventQuery = _eventColletionReference.orderBy("timeStamp");
    eventQuery.snapshots().listen((event) {
      var item = event.documents
          .map((snapshot) => Event.fromDocumentSnapShot(snapshot))
          .toList();
      _eventController.add(item);
    });
  }

  Stream listenToEventsData() {
    _requestEventsData();
    return _eventController.stream;
  }

  Stream listenToUpcoming() {
    _requestUpcomingData();
    return _upcomingController.stream;
  }

  void _requestUpcomingData() {
    var eventQuery = _eventColletionReference.orderBy("timeStamp").limit(1);
    eventQuery.snapshots().listen((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var eventItem = Event.fromDocumentSnapShot(snapshot.documents[0]);
        print("event item is:" + eventItem.toString());
        _upcomingController.add(eventItem);
      }
    });
  }

  Stream listenToFeedRealTime() {
    _requestFeedItems();
    return _feedController.stream;
  }

  void _requestFeedItems() {
    var feedQuery = _feedColletionReference
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

  Stream listenToAnnouncement(){
    _requestAnnounceData();
    return _announceController.stream;

  }

  void _requestAnnounceData(){
    var query=_announcementsCollectionReference.orderBy("timeStamp");
    query.snapshots().listen((snapshot){
      if(snapshot.documents.isNotEmpty){
        var item = snapshot.documents
            .map((snapshot) => Announcement.fromSnapshot(snapshot))
            .toList();
        print(item.toString());
        _announceController.add(item);
      }
    });
  }

  getTimeAgo(DateTime dateTime) {
    final present = DateTime.now();
    final diff = present.difference(dateTime);
    if ((diff.inDays / 365).floor() >= 1) {
      return '${(diff.inDays / 365).floor()} years ago';
    } else if ((diff.inDays / 30).floor() >= 1) {
      return '${(diff.inDays / 365).floor()} months ago';
    }  else if ((diff.inDays / 7).floor() >= 1) {
      return '${(diff.inDays / 7).floor()} weeks ago';
    } else if (diff.inDays >= 2) {
      return '${diff.inDays} days ago';
    } else if (diff.inDays >= 1) {
      return 'Yesterday';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hours ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minutes ago';
    } else if (diff.inSeconds >= 2) {
      return '${diff.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  void requestMoreData() => _requestFeedItems();

  Stream getClubListStream() {
    // Register the handler for when the posts data changes
    _clubsColletionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map((snapshot) => Club.fromSnapshot(snapshot))
            .toList();

        // Add the posts onto the controller
        _clubStreamController.add(posts);
      }
    });

    return _clubStreamController.stream;
  }

  Future followClub(String clubId, User user) async {
    await _clubsColletionReference
        .document(clubId)
        .collection("followers")
        .document(user.id)
        .setData({
      "id": user.id,
    });
  }
}
