import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/core/models/event/event.dart';

class EventsService {
  final Firestore firestore;

  final CollectionReference _eventRef;

  // For Testing
  EventsService(this.firestore) : _eventRef = firestore.collection("events");

  final StreamController<List<Event>> _eventStreamController =
      StreamController<List<Event>>.broadcast();

  Stream getEvents() {
    var query = _eventRef.orderBy("timeStamp");

    query.snapshots().listen((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var items = snapshot.documents
            .map((snapshot) => Event.fromDocument(snapshot))
            .toList();

        _eventStreamController.add(items);
      }
    });

    return _eventStreamController.stream;
  }
}
