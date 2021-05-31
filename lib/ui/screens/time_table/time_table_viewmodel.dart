import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/ui/screens/admin screens/add_edit_time_table/add_edit_time_table.dart';

class TimeTableViewModel extends BaseViewModel {
  final log = getLogger("TimeTableViewModel");
  final TimeTableService timeTableService = locator<TimeTableService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<TimeTable> _timeTableItems;
  List<TimeTable> get timeTable => _timeTableItems;

  changeCurrentDay(int index) {
    currentDay = weekDates[index];
    currentIndex = index;
    notifyListeners();
  }

  List<int> weekDates = generateCurrentWeekDays();

  int currentDay = DateTime.now().day;
  int currentIndex;

  init() async {
    log.wtf(weekDates);
    currentIndex = weekDates.indexOf(DateTime.now().day);
    List<TimeTable> items = timeTableService.streamData;

    if (items != null) {
      _timeTableItems = items;
    }
  }

  List<TimeTable> getCurrentDayTimeTable() {
    var currentWeekDay = weekDays[currentIndex];

    // var result =
    //     _timeTableItems.where((element) => element.day == currentWeekDay);
    // return result.toList();
  }

  getTimeTable() {
    var data = _timeTableItems != null
        ? currentIndex == 6
            ? Text("RELAX")
            : getCurrentDayTimeTable()
        : [];
    log.wtf(data);
    return data;
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
}
