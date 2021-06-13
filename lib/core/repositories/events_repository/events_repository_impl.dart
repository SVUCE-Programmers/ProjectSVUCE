import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/repositories/events_repository/events_repository.dart';

@Singleton(as: EventsRepository)
class EventsRepositoryImpl implements EventsRepository {
  final log = getLogger("Event Repository Impl");
  static FirebaseFirestore firestore = locator<FirebaseFirestore>();
  final CollectionReference _eventRef = firestore.collection("events");

  // For Testing
  final StreamController<List<Event>> _eventStreamController =
      StreamController<List<Event>>.broadcast();

  @override
  Stream getEvents() {
    var query = _eventRef.orderBy("timeStamp").where("timeStamp");
    query.snapshots().listen((snapshot) {
      log.d(snapshot.docs);

      var items = snapshot.docs
          .map((snapshot) =>
              Event.fromMap(Map<String, dynamic>.from(snapshot.data())))
          .toList();

      _eventStreamController.add(items);
    });

    return _eventStreamController.stream;
  }

  @override
  Future<bool> createEvent(Event event) async {
    try {
      await _eventRef.add(event.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteEvent(Event event) async {
    try {
      await _eventRef.doc(event.id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateEvent(Event event) async {
    try {
      await _eventRef.doc(event.id).update(event.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Event> getEventDetails(String id) async {
    log.w(id);

    DocumentSnapshot data = await _eventRef.doc(id).get();
    log.w(data);
    if (data.exists) {
      Event event = Event.fromMap(Map<String, dynamic>.from(data.data()));
      return event;
    } else {
      return null;
    }
  }
}
