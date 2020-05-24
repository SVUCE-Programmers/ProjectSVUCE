import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/services/attendance_service.dart';

class AttendanceViewModel extends BaseViewModel {
  final AttendanceService _attendanceService = locator<AttendanceService>();

  final String boxName = "Attendance";

  List<Attendance> _attendanceList = [];
  List<Attendance> get attendanceList => _attendanceList;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

  addPresent(int index) async {
    setBusy(true);

    await _attendanceService.addPresent(index);

    setBusy(false);
  }

  addAbsent(int index) async {
    setBusy(true);

    await _attendanceService.addAbsent(index);

    setBusy(false);
  }

  init() async {
    await getAttendance();
  }

  getAttendance() async {
    var result = await _attendanceService.init();

    if (result is bool) {
      if (result) {
        List<Attendance> items = _attendanceService.attendanceList;

        if (items != null) {
          _attendanceList = items;
          notifyListeners();
        }
      }
    }
  }
}
