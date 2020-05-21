import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/models/time_table.dart';
import 'package:svuce_app/services/api_service.dart';
import 'package:svuce_app/services/auth_service.dart';
import 'package:svuce_app/services/hive_service.dart';
import 'package:svuce_app/ui/views/time_table/utils.dart';

class TimeTableViewModel extends BaseViewModel {
  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();
  final SnackbarService snackbarService = locator<SnackbarService>();

  var url =
      "https://raw.githubusercontent.com/shashiben/luffy/master/timetable.json";

  getTimeTable() async {
    bool exists = await hiveService.isExists(boxName: "TimeTable");

    if (exists) {
      // Getting data from Hive
      setBusy(true);

      List<dynamic> temp = await hiveService.getBoxes<TimeTable>("TimeTable");

      for (var item in temp) {
        if (item.year == authenticationService.getStudentPresentYear()) {
          _classes.add(item);
        }
      }

      setBusy(false);
    } else {
      // Getting data from API and storing in hive for later usage
      setBusy(true);

      try {
        var result = await apiService.fetchData(url: url);

        (result as List).map((item) {
          TimeTable staffItem = TimeTable(
              className: item["class_name"],
              startTime: item["start_time"],
              endTime: item["end_time"],
              day: item["day"],
              year: item["year"]);
          _classes.add(staffItem);
        }).toList();

        await hiveService.addBoxes<TimeTable>(_classes, "TimeTable");

        setBusy(false);
      } catch (e) {
        setBusy(false);
        return snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          icon: Icon(
            infoIcon,
            color: errorColor,
          ),
          backgroundColor: surfaceColor,
          title: commonErrorTitle,
          message: commonErrorInfo,
        );
      }
    }
  }

  List<dynamic> _classes = [];
  List<dynamic> get classes => _classes;

  changeCurrentDay(int index) {
    currentDay = weekDates[index];
    currentIndex = index;
    notifyListeners();
  }

  List<int> weekDates = generateCurrentWeekDays();

  int currentDay = DateTime.now().day;
  int currentIndex;

  init() {
    getTimeTable();
    currentIndex = weekDates.indexOf(DateTime.now().day);
  }

  List<dynamic> getCurrentDayTimeTable() {
    var currentWeekDay = weekDays[currentIndex];
    var result = _classes.where((element) => element.day == currentWeekDay);
    return result.toList();
  }
}
