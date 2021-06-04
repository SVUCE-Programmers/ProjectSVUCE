import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/core/models/event/event.dart' as eventModel;
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

class NotifyService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final log = getLogger("Notify Service");
  addAlarm(BuildContext context) async {
    scheduleAlarm(DateTime.now());
  }

  printAlarmFired() {
    log.v("Done");
  }

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

  initFlutterNotifications() async {
    var initAndroidSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    //?TODO IOS CONFIG
    var initializationSettings =
        InitializationSettings(android: initAndroidSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) async {
      log.i("Got payload is:$payload");
    });
  }

  void scheduleAlarm(DateTime scheduledNotificationDateTime) async {
    await initFlutterNotifications();
    initializeTimeZones();

    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      "title",
      "body",
      TZDateTime.now(getLocation(currentTimeZone)).add(Duration(seconds: 5)),
      NotificationDetails(
          android: AndroidNotificationDetails(
        "0",
        "channelName",
        "channelDescription",
        importance: Importance.high,
        priority: Priority.max,
        showProgress: true,
        playSound: true,
        enableVibration: true,
      )),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      androidAllowWhileIdle: true,
    );
  }
}
