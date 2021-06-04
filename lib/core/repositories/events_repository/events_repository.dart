import 'package:svuce_app/core/models/event/event.dart';

abstract class EventsRepository {
  Stream getEvents();
  Future<bool> createEvent(Event event);
  Future<bool> updateEvent(Event event);
  Future<bool> deleteEvent(Event event);
}
