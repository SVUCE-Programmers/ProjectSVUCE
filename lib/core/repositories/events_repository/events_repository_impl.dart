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
    var query = _eventRef.orderBy("timeStamp");
    query.snapshots().listen((snapshot) {
      log.d(snapshot.docs);

      var items = snapshot.docs
          .map((snapshot) => Event.fromDocument(snapshot))
          .toList();

      _eventStreamController.add(items);
    });

    return _eventStreamController.stream;
  }
}
