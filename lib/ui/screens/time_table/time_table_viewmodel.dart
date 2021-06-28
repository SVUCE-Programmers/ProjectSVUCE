import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/alarm_service.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/ui/screens/admin screens/add_edit_time_table/add_edit_time_table.dart';

class TimeTableViewModel extends BaseViewModel {
  final log = getLogger("TimeTableViewModel");
  final TimeTableService timeTableService = locator<TimeTableService>();
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final NotifyService _notifyService = NotifyService();
  TimeTable timeTable;
  bool hasAdminAccess = false;

  changeCurrentDay(int index) {
    currentDay = weekDates[index].day;
    currentIndex = index;
    notifyListeners();
  }

  List<DateTime> weekDates = generateCurrentWeekDays();

  int currentDay = DateTime.now().day;
  int currentIndex;

  init() async {
    getAdminAccess();
    log.wtf(weekDates);
    currentIndex = weekDates
        .map((e) => e.day == DateTime.now().day ? weekDates.indexOf(e) : -1)
        .toList()[0];
    log.wtf('Current Index  at Init is:$currentIndex');
    String rollNo = _authService.currentUser.rollNo.toString().substring(0, 6);
    timeTableService.getTimeTable(rollNo).listen((event) {
      timeTable = event;
      log.wtf("Got TimeTable is:$event");
      notifyListeners();
    });
  }

  getAdminAccess() {
    hasAdminAccess = _authService.hasAdminAccess;
    notifyListeners();
  }

  //?Navigation Services
  navigateBack() {
    _navigationService.back();
  }

  navigateToEditTimeTable() {
    _navigationService.navigateWithTransition(AddEditTimeTableView(),
        transition: "rightToLeftWithFade",
        duration: Duration(milliseconds: 700));
  }

  Map<String, String> getTimeTable() {
    log.wtf(currentIndex);
    switch (currentIndex + 1) {
      case 1:
        return timeTable.monday;
      case 2:
        return timeTable.tuesday;
      case 3:
        return timeTable.wednesday;
      case 4:
        return timeTable.thursday;
      case 5:
        return timeTable.friday;
      case 6:
        return timeTable.saturday;
      case 7:
        return {};
      default:
        return {};
    }
  }

  addAlarm(context, String title, String time) {
    var hour = (time.split("-")[0].split(":")[0]);
    var minute = (time.split("-")[0].split(":")[1]);
    minute = minute.replaceAll("PM", "");
    minute = minute.replaceAll("AM", "");

    DateTime dateTime = DateTime.now();
    DateTime schedulingTime = DateTime(
        weekDates[currentIndex].year,
        weekDates[currentIndex].month,
        weekDates[currentIndex].day,
        int.parse(hour),
        int.parse(minute));
    if (schedulingTime.millisecondsSinceEpoch <
        dateTime.millisecondsSinceEpoch) {
      showToast("Can't schedule alarm at this time",
          backgroundColor: Colors.red);
    } else {
      _notifyService.addAlarm(context,
          title: title,
          subject: "Get ready for $title class",
          dateTime: schedulingTime);
    }
  }
}
