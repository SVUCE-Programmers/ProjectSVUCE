import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/services/api_service.dart';
import 'package:svuce_app/services/auth_service.dart';
import 'package:svuce_app/services/hive_service.dart';

class AttendanceViewModel extends BaseViewModel {
  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();
  final SnackbarService snackbarService = locator<SnackbarService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  List<Attendance> _attList = [];
  List<Attendance> get atList => _attList;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var url =
      "https://raw.githubusercontent.com/shashiben/luffy/master/timetable.json";

  getStatus(int present, int total) {
    if (total != 0) {
      double percent = (present / total) * 100;
      String status = "";
      if (percent == 75) {
        status = "You are on the right track";
      } else if (percent < 75) {
        status = "You need to attend " +
            getCount(present, total, true).toString() +
            " classes to cover";
      } else {
        status = "You can bunk " +
            getCount(present, total, false).toString() +
            " classes";
      }
      return status;
    } else {
      return "";
    }
  }

  getCount(int present, int total, bool low) {
    int pre = present;
    int count = 0;
    if (low) {
      while (pre / total <= 0.75) {
        pre += 1;
        total += 1;
        if (pre / total <= 0.75) {
          count += 1;
        }
      }
    } else {
      while (pre / total >= 0.75) {
        total += 1;
        if (pre / total >= 0.75) {
          count += 1;
        }
      }
    }
    return count;
  }

  getSubjectList() async {
    bool exists = await hiveService.isExists(boxName: "Attendance");
    if (exists) {
      setBusy(true);
      _attList = await hiveService.getBoxes<Attendance>("Attendance");
      setBusy(false);
    } else {
      setBusy(true);
      bool subExists = await hiveService.isExists(boxName: "TimeTable");
      if (subExists) {
        final openBox = await Hive.openBox("Attendance");
        List<dynamic> temp = await hiveService.getBoxes<TimeTable>("TimeTable");
        List<String> dummy = [];
        print("Temp ata atterndance:" + temp.toString());
        for (var item in temp) {
          if (item.year == authenticationService.getStudentPresentYear()) {
            print("Item at adding in temp:" + item.year.toString());
            Attendance atitem = Attendance(
                subject: item.className,
                present: 0,
                absent: 0,
                total: 0,
                lastUpdated: "Nothing");
            print("Attendance item at creation:" + atitem.toString());
            if (!dummy.contains(atitem.subject)) {
              openBox.add(atitem);
              dummy.add(atitem.subject);
              _attList.add(atitem);
            }
          }
        }
        setBusy(false);
      } else {
        getTT();
      }
    }
  }

  addPresent(String subject, int index) async {
    setBusy(true);
    var box = Hive.box("Attendance").getAt(index) as Attendance;
    Attendance at = Attendance(
        subject: box.subject,
        total: box.total + 1,
        present: box.present + 1,
        absent: box.absent,
        lastUpdated: "Present");
    Hive.box("Attendance").putAt(index, at);
    _attList = await hiveService.getBoxes<Attendance>("Attendance");

    setBusy(false);
    notifyListeners();
  }

  addAbsent(String subject, int index) async {
    setBusy(true);
    var box = Hive.box("Attendance").getAt(index) as Attendance;
    Attendance at = Attendance(
        subject: box.subject,
        total: box.total + 1,
        present: box.present,
        absent: box.absent + 1,
        lastUpdated: "Absent");
    Hive.box("Attendance").putAt(index, at);
    _attList = await hiveService.getBoxes<Attendance>("Attendance");

    setBusy(false);
    notifyListeners();
  }

  getTT() async {
    List<dynamic> temp = [];
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
        temp.add(staffItem);
      }).toList();
      final openBox = await Hive.openBox("TimeTable");
      for (var item in temp) {
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

  init() {
    getSubjectList();
  }
}
