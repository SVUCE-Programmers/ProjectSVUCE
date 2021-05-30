import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';

@lazySingleton
class AttendanceService {
  final log = getLogger("Attendance Service");
  //Required Services
  final HiveService _hiveService = locator<HiveService>();
  final TimeTableService timeTableService = locator<TimeTableService>();
  final StreamController<List<Attendance>> _attendanceStream =
      StreamController<List<Attendance>>.broadcast();

  List<Attendance> _attendanceList = [];
  List<Attendance> get attendanceList => _attendanceList;

  final String boxName = "Attendance";

  /// This method is used to fetch attendance. If its available in hive
  /// it will get it directly. If not we'll build the attendance from
  /// time table.
  init() async {
    bool exists = await _hiveService.isExists(boxName: boxName);

    // Getting data from Hive
    if (exists) {
      _attendanceList = await _hiveService.getBoxes<Attendance>(boxName);
      _attendanceStream.add(_attendanceList);

      return true;
    }
    // Building data from time_table
    else {
      // List<TimeTable> timeTable = timeTableService.streamData;

      // List<String> duplicateHelperList = [];

      // for (var item in timeTable) {
      //   // Creating attendance for each subject
      //   Attendance atitem = Attendance(
      //       subject: item.className,
      //       present: 0,
      //       absent: 0,
      //       total: 0,
      //       lastUpdated: ["Nothing"]);

      //   if (!duplicateHelperList.contains(atitem.subject)) {
      //     duplicateHelperList.add(atitem.subject);
      //     _attendanceList.add(atitem);
      //   }
      // }

      // // Uploading the data to hive
      // await _hiveService.addBoxes<Attendance>(_attendanceList, boxName);

      // return true;
    }
  }

  addPresent(int index) async {
    var box = _attendanceList[index];

    Attendance newAttendance = Attendance(
        color: box.color,
        subject: box.subject,
        total: box.total + 1,
        present: box.present + 1,
        absent: box.absent,
        lastUpdated: [...box.lastUpdated, "Present"]);

    await _hiveService.updateBoxAtIndex(boxName, newAttendance, index);
    _attendanceList[index] = newAttendance;
    _attendanceStream.add(_attendanceList);
  }

  addAbsent(int index) async {
    var box = _attendanceList[index];

    Attendance newAttendance = Attendance(
        color: box.color,
        subject: box.subject,
        total: box.total + 1,
        present: box.present,
        absent: box.absent + 1,
        lastUpdated: [...box.lastUpdated, "Absent"]);

    await _hiveService.updateBoxAtIndex(boxName, newAttendance, index);

    _attendanceList[index] = newAttendance;
    _attendanceStream.add(_attendanceList);
  }

  addNewSubject({@required String name, @required int color}) async {
    Attendance newAttendance = Attendance(
        color: color,
        subject: name,
        total: 0,
        present: 0,
        absent: 0,
        lastUpdated: []);
    await _hiveService.addBoxes<Attendance>([newAttendance], boxName);
    _attendanceList.add(newAttendance);
    _attendanceStream.add(_attendanceList);
  }

  deleteSubject(
      {@required Attendance attendance, @required String boxName}) async {
    bool exists = await _hiveService.isExists(boxName: boxName);

    if (exists) {
      await _hiveService.deleteItem(boxName: "$boxName", item: attendance);
    }
    _attendanceList = await _hiveService.getBoxes<Attendance>(boxName);
    _attendanceStream.add(_attendanceList);
  }

  undoAction(
      {@required Attendance attendance,
      @required String boxName,
      @required int index}) async {
    var data = attendance.lastUpdated.last;
    log.d(data);
    switch (data) {
      case "Absent":
        attendance.lastUpdated.removeLast();
        Attendance newAttendance = Attendance(
            color: attendance.color,
            total: attendance.total - 1,
            lastUpdated: attendance.lastUpdated,
            subject: attendance.subject,
            present: attendance.present,
            absent: attendance.absent - 1);
        await _hiveService.updateBoxAtIndex<Attendance>(
            boxName, newAttendance, index);

        _attendanceList = await _hiveService.getBoxes<Attendance>(boxName);
        _attendanceStream.add(_attendanceList);

        break;
      case "Present":
        attendance.lastUpdated.removeLast();
        Attendance newAttendance = Attendance(
            color: attendance.color,
            lastUpdated: attendance.lastUpdated,
            total: attendance.total - 1,
            subject: attendance.subject,
            present: attendance.present - 1,
            absent: attendance.absent);
        await _hiveService.updateBoxAtIndex<Attendance>(
            boxName, newAttendance, index);
        _attendanceList = await _hiveService.getBoxes<Attendance>(boxName);
        _attendanceStream.add(_attendanceList);

        break;
      case "Nothing":
        break;
      default:
    }
  }

  modifyData(Attendance attendance, int index) async {
    Attendance newAttendance = Attendance(
        color: attendance.color,
        total: attendance.total,
        lastUpdated: attendance.lastUpdated,
        subject: attendance.subject,
        present: attendance.present,
        absent: attendance.absent);
    await _hiveService.updateBoxAtIndex<Attendance>(
        boxName, newAttendance, index);
    _attendanceList = await _hiveService.getBoxes<Attendance>(boxName);
    _attendanceStream.add(_attendanceList);
  }

  clearBox(String boxName) async {
    await _hiveService.clearItemsInBox(boxName);
  }

  Stream getAttendanceStream() {
    return _attendanceStream.stream;
  }
}
