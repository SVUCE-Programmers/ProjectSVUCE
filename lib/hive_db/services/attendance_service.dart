import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';

@lazySingleton
class AttendanceService {
  //Required Services
  final HiveService _hiveService = locator<HiveService>();
  final TimeTableService timeTableService = locator<TimeTableService>();

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

      return true;
    }
    // Building data from time_table
    else {
      List<TimeTable> timeTable = timeTableService.streamData;

      List<String> duplicateHelperList = [];

      for (var item in timeTable) {
        // Creating attendance for each subject
        Attendance atitem = Attendance(
            subject: item.className,
            present: 0,
            absent: 0,
            total: 0,
            lastUpdated: "Nothing");

        if (!duplicateHelperList.contains(atitem.subject)) {
          duplicateHelperList.add(atitem.subject);
          _attendanceList.add(atitem);
        }
      }

      // Uploading the data to hive
      await _hiveService.addBoxes<Attendance>(_attendanceList, boxName);

      return true;
    }
  }

  addPresent(int index) async {
    var box = _attendanceList[index];

    Attendance newAttendance = Attendance(
        subject: box.subject,
        total: box.total + 1,
        present: box.present + 1,
        absent: box.absent,
        lastUpdated: "Present");

    await _hiveService.updateBoxAtIndex(boxName, newAttendance, index);

    _attendanceList[index] = newAttendance;
  }

  addAbsent(int index) async {
    var box = _attendanceList[index];

    Attendance newAttendance = Attendance(
        subject: box.subject,
        total: box.total + 1,
        present: box.present,
        absent: box.absent + 1,
        lastUpdated: "Absent");

    await _hiveService.updateBoxAtIndex(boxName, newAttendance, index);

    _attendanceList[index] = newAttendance;
  }
}
