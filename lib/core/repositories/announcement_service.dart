import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/announcement/announcement.dart';

class AnnouncementService {
  static Firestore firestore = locator<Firestore>();
  static CollectionReference _announcementRef =
      firestore.collection("announcements");

  final StreamController<List<Announcement>> _announcementStreamController =
      StreamController<List<Announcement>>.broadcast();

  Stream getAnnouncements() {
    var query = _announcementRef.orderBy("timeStamp");

    query.snapshots().listen((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var items = snapshot.documents
            .map((snapshot) => Announcement.fromDocument(snapshot))
            .toList();

        _announcementStreamController.add(items);
      }
    });

    return _announcementStreamController.stream;
  }
}
