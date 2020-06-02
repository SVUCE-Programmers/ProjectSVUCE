import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/attendance_service.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/models/graph.dart';
import 'package:svuce_app/services/api_service.dart';
import 'package:svuce_app/services/auth_service.dart';

import 'package:svuce_app/ui/views/action_center/dataset.dart';

class ActionCenterViewModel extends BaseViewModel {
  final TimeTableService timeTableService = locator<TimeTableService>();
  final AttendanceService _attendanceService = locator<AttendanceService>();
  final APIService apiService = locator<APIService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();
  final SnackbarService snackbarService = locator<SnackbarService>();

  List<TimeTable> timeTableData = List<TimeTable>();
  AnimationController controller;

  List<double> _percentages = [];
  List<double> get percentages => _percentages;

  List<String> _subjects = [];
  List<String> get subjects => _subjects;

  getPercentage() async {
    setBusy(true);

    var result = await _attendanceService.init();

    if (result is bool) {
      if (result) {
        List<Attendance> items = _attendanceService.attendanceList;

        if (items != null) {
          for (var item in items) {
            if (item.total != 0) {
              _percentages.add(((item.present) / (item.total)));
            } else {
              _percentages.add(0);
            }

            _subjects.add(item.subject);
          }
        }
      }
    }

    setBusy(false);
  }

  getGraph() {
    DataSet dataSet = DataSet(percentages);
    Graph graph = Graph([dataSet], "", "%");
    graph.domainStart = 0;
    graph.domainEnd = 4;
    graph.rangeStart = 0;
    graph.rangeEnd = 10;
    graph.selectedDataPoint = 1;
    return graph;
  }

  getTimeTable() async {
    getPercentage();
    var result = await timeTableService.getTimeTable();

    if (result is bool) {
      if (result) {
        List<TimeTable> items = timeTableService.getCurrentDayClasses();

        if (items != null) {
          timeTableData = items;
          notifyListeners();
        }
      }
    }
  }
}
