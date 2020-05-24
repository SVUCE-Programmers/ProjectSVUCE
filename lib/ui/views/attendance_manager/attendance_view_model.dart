import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/services/api_service.dart';
import 'package:svuce_app/services/auth_service.dart';

class AttendanceViewModel extends BaseViewModel {
  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();
  final TimeTableService timeTableService = locator<TimeTableService>();
  final SnackbarService snackbarService = locator<SnackbarService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  final String boxName = "Attendance";

  List<Attendance> _attendanceList = [];
  List<Attendance> get atList => _attendanceList;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final String url =
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
    bool exists = await hiveService.isExists(boxName: boxName);

    if (exists) {
      setBusy(true);

      _attendanceList = await hiveService.getBoxes<Attendance>(boxName);

      setBusy(false);
    } else {
      setBusy(true);

      List<TimeTable> timeTable = timeTableService.streamData;

      List<String> dummy = [];

      for (var item in timeTable) {
        Attendance atitem = Attendance(
            subject: item.className,
            present: 0,
            absent: 0,
            total: 0,
            lastUpdated: "Nothing");

        if (!dummy.contains(atitem.subject)) {
          dummy.add(atitem.subject);
          _attendanceList.add(atitem);
        }
      }

      await hiveService.addBoxes<Attendance>(_attendanceList, boxName);

      setBusy(false);
    }
  }

  addPresent(String subject, int index) async {
    setBusy(true);

    var box = await hiveService.getBoxAtIndex<Attendance>(boxName, index);

    Attendance newAttendance = Attendance(
        subject: box.subject,
        total: box.total + 1,
        present: box.present + 1,
        absent: box.absent,
        lastUpdated: "Present");

    await hiveService.updateBoxAtIndex(boxName, newAttendance, index);

    _attendanceList = await hiveService.getBoxes<Attendance>(boxName);

    setBusy(false);
  }

  addAbsent(String subject, int index) async {
    setBusy(true);

    var box = hiveService.getBoxAtIndex<Attendance>("", index);

    Attendance newAttendance = Attendance(
        subject: box.subject,
        total: box.total + 1,
        present: box.present,
        absent: box.absent + 1,
        lastUpdated: "Absent");

    await hiveService.updateBoxAtIndex(boxName, newAttendance, index);

    _attendanceList = await hiveService.getBoxes<Attendance>(boxName);

    setBusy(false);
  }

  init() {
    getSubjectList();
  }
}
