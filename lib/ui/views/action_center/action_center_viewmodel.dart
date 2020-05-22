import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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

class ActionCenterViewModel extends BaseViewModel{
  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();
  final SnackbarService snackbarService = locator<SnackbarService>();

  List<dynamic> _classes = [];
  List<dynamic> get classes => _classes;

  var day=getCurrentWeekDay( DateTime.now().weekday);

  var url="https://raw.githubusercontent.com/shashiben/luffy/master/timetable.json";

  getTimeTable() async{
    bool exists = await hiveService.isExists(boxName: "TimeTable");
    if (exists) {
      print("Getting from hive");
      setBusy(true);
      List<dynamic> temp = await hiveService.getBoxes<TimeTable>("TimeTable");
      String year=authenticationService.getStudentPresentYear();
      for (var item in temp){
        print("Year will be:"+year.toString());
        if (item.year==year){
          _classes.add(item);
        }

      }
      
      setBusy(false);
    } else {
      print("Getting from Api");
      String year=authenticationService.getStudentPresentYear();
      List<dynamic> temp=[];
      setBusy(true);
      try {
        var result = await apiService.fetchData(url: url);
        (result as List).map((item) {
          TimeTable staffItem = TimeTable(
            className : item["class_name"],
            startTime : item["start_time"],
            endTime : item["end_time"],
            day : item["day"],
            year: item["year"]
          );
          temp.add(staffItem);
        }).toList();
        final openBox = await Hive.openBox("TimeTable");
        for (var item in temp) {
            if (item.year==year){
              _classes.add(item);
            }
            openBox.add(item);
        }
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
}