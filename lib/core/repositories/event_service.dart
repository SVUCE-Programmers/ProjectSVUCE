import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/event/event.dart';

class EventsService {
  static Firestore firestore = locator<Firestore>();

  final CollectionReference _eventRef = firestore.collection("events");

  // For Testing

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
