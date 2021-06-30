import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/event/event.dart' as eventModel;
import 'package:svuce_app/core/services/firebaseAnalyticsService.dart';
import 'package:svuce_app/ui/screens/main/consumers/imports.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

class NotifyService {
  final AnalyticsService _analyticsService = locator<AnalyticsService>();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final log = getLogger("Notify Service");
  addAlarm(BuildContext context,
      {String title, DateTime dateTime, String subject}) async {
    log.wtf("Scheduled Alarm for :$dateTime");
    scheduleAlarm(dateTime, title: title, subject: subject);
  }

  addEventToCalendar({eventModel.Event eventModel}) async {
    final Event event = Event(
      title: eventModel.name,
      description: eventModel.description,
      location: eventModel.place,
      startDate: DateTime.fromMillisecondsSinceEpoch(eventModel.startTime),
      endDate: DateTime.fromMillisecondsSinceEpoch(eventModel.endTime),
      iosParams: IOSParams(
        reminder: Duration(hours: 5),
      ),
      androidParams: AndroidParams(
        emailInvites: [],
      ),
    );
    bool res = await Add2Calendar.addEvent2Cal(event);
    if (res) {
      _analyticsService.logEvent(
          name: "Event Added to calendar", parameters: eventModel.toMap());
    } else {
      showToast("Error in adding event",
          backgroundColor: Colors.red,
          radius: 8,
          textPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20));
    }
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

  void scheduleAlarm(DateTime scheduledNotificationDateTime,
      {String title, String subject}) async {
    await initFlutterNotifications();
    initializeTimeZones();

    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      "$title",
      "$subject",
      TZDateTime.now(getLocation(currentTimeZone)).add(Duration(seconds: 5)),
      NotificationDetails(
          android: AndroidNotificationDetails(
        "0",
        "channelName",
        "channelDescription",
        importance: Importance.high,
        priority: Priority.max,
        playSound: true,
        enableVibration: true,
      )),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      androidAllowWhileIdle: true,
    );
  }
}
