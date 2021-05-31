import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/core/models/event/event.dart' as eventModel;

class NotifyService {
  addAlarm(BuildContext context) async {}
  addEventToCalendar({eventModel.Event eventModel}) async {
    final Event event = Event(
      title: eventModel.name,
      description: eventModel.description,
      location: eventModel.place,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      iosParams: IOSParams(
        reminder: Duration(),
      ),
      androidParams: AndroidParams(
        emailInvites: [],
      ),
    );
    Add2Calendar.addEvent2Cal(event);
  }
}
