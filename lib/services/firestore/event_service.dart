import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/event.dart';

class EventsService {
  static Firestore _firestore = locator<Firestore>();

  static CollectionReference _eventRef = _firestore.collection("events");

  final StreamController<List<Event>> _eventStreamController =
      StreamController<List<Event>>.broadcast();

  Stream getEvents() {
    var query = _eventRef.orderBy("timeStamp");

    query.snapshots().listen((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var items = snapshot.documents
            .map((snapshot) => Event.fromDocumentSnapShot(snapshot))
            .toList();

        _eventStreamController.add(items);
      }
    });

    return _eventStreamController.stream;
  }
}
