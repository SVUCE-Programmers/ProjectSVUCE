import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/services/attendance_service.dart';

class AttendanceViewModel extends BaseViewModel {
  final AttendanceService _attendanceService = locator<AttendanceService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final String boxName = "Attendance";

  List<Attendance> _attendanceList = [];
  List<Attendance> get attendanceList => _attendanceList;

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
    List<Attendance> items = _attendanceService.attendanceList;

    if (items != null) {
      _attendanceList = items;
      notifyListeners();
    }
  }

  List<PieChartSectionData> pieCharSelectionData = [
    PieChartSectionData(
        value: 25, color: Colors.blue, radius: 25, showTitle: false),
    PieChartSectionData(
        value: 20, color: Color(0xFF26E5FF), radius: 22, showTitle: false),
    PieChartSectionData(
        value: 10, color: Color(0xFFFFCF26), radius: 19, showTitle: false),
    PieChartSectionData(
        value: 15, color: Color(0xFFEE2727), radius: 16, showTitle: false),
    PieChartSectionData(
        value: 25,
        color: Colors.blue.withOpacity(0.1),
        radius: 13,
        showTitle: false),
  ];

  navigateBack() {
    _navigationService.back();
  }
}
