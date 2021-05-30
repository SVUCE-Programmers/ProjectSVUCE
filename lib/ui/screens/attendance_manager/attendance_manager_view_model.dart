import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/services/attendance_service.dart';

class AttendanceManagerViewModel extends BaseViewModel {
  final log = getLogger("Attendance Manager");
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

  getAttendance() async {
    setBusy(true);
    await _attendanceService.init();
    setBusy(false);

    List<Attendance> items = _attendanceService.attendanceList;
    log.d(items);
    if (items != null) {
      _attendanceList = items;
      notifyListeners();
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

  addNewSubject(String name, Color color) async {
    await _attendanceService.addNewSubject(name: name, color: color.value);
    navigateBack();
    notifyListeners();
  }

  navigateBack() {
    _navigationService.back();
  }

  generatePieChartData() {
    List<PieChartSectionData> pieCharSelectionData = [];
    if (attendanceList.length == 0) {
      return <PieChartSectionData>[];
    }
    attendanceList.asMap().forEach((key, value) {
      log.d(value.color.runtimeType);

      pieCharSelectionData.add(PieChartSectionData(
          color: value.color.runtimeType != Null
              ? Color(value.color)
              : Colors.orange,
          value: value.total == 0 ? 0.0 : (value.present / value.total),
          radius: 30,
          showTitle: false,
          title: value.subject));
    });
    return pieCharSelectionData;
  }

  totalClasses() {
    int sum = 0;
    attendanceList.asMap().forEach((key, value) {
      sum += value.total;
    });
    return sum;
  }

  totalPresentClasses() {
    int sum = 0;
    attendanceList.asMap().forEach((key, value) {
      sum += value.present;
    });
    return sum;
  }

  deleteSubject(Attendance attendance) async {
    await _attendanceService.deleteSubject(
        attendance: attendance, boxName: boxName);
    _attendanceList = _attendanceService.attendanceList;

    notifyListeners();
  }

  Color randomColor() {
    return Color(Random().nextInt(0xffffffff));
  }

  modifyAttendance(Attendance attendance, int total, int absent, int present,
      int index) async {
    Attendance newAttendance = Attendance(
        total: total,
        absent: absent,
        present: present,
        subject: attendance.subject,
        color: attendance.color,
        lastUpdated: List.generate(total, (index) => "Nothing"));
    await _attendanceService.modifyData(
      newAttendance,
      index,
    );
    _attendanceList = _attendanceService.attendanceList;

    notifyListeners();
    _navigationService.back();
  }

  undoAttendance(Attendance attendance, int index) async {
    setBusy(true);
    await _attendanceService.undoAction(
        attendance: attendance, boxName: boxName, index: index);
    _attendanceList = _attendanceService.attendanceList;
    setBusy(false);
  }
}
