import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/excel%20service/excel_service.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/services/attendance_service.dart';
import 'package:svuce_app/ui/screens/attendance_manager/take_attendance.dart';
import 'package:svuce_app/ui/screens/attendance_manager/view_attendance.dart';

class AttendanceViewModel extends BaseViewModel {
  final log = getLogger("Attendance ViewModel");
  final AttendanceService _attendanceService = locator<AttendanceService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ExcelService _excelService = locator<ExcelService>();

  final String boxName = "Attendance";

  List<String> excelSheets = [];
  bool isExcelCreated = false;

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
    isExcelCreated = await _excelService.isExcelCreatedForStaff();
    log.i("IS Excel Created:$isExcelCreated");
    if (isExcelCreated) {
      await _excelService.initForStaffExcel();
      excelSheets = await _excelService.getNumberOfSheetsForStaff();
      notifyListeners();
    }
    await getAttendance();
  }

  getAttendance() async {
    List<Attendance> items = _attendanceService.attendanceList;

    if (items != null) {
      _attendanceList = items;
      notifyListeners();
    }
  }

  navigateBack() {
    _navigationService.back();
  }

  addNewSheetForStaff(
      {String sheetName,
      String totalCount,
      List<String> excludingNo,
      String startingNo}) async {
    log.d(
        "Sheet Name iS:$sheetName and totalCount is:$totalCount and excluding List is:$excludingNo and starting no is:$startingNo");
    List<int> totalList =
        List.generate(int.parse(totalCount), (index) => (index + 1));
    for (String s in excludingNo) {
      totalList.remove(int.parse(s));
    }
    log.d("Final Total List is:$totalList");
    await _excelService.createNewSheet(
        sheetName: sheetName, rollList: totalList);
    _navigationService.back();
    excelSheets = await _excelService.getNumberOfSheetsForStaff();
    isExcelCreated = await _excelService.isExcelCreatedForStaff();
    notifyListeners();
  }

  Map<int, String> attendanceData = {};

  getSheetData(String sheetName) async {
    List<int> data =
        await _excelService.getSheetDetailsForStaff(sheetName: sheetName);
    data.asMap().forEach((key, value) {
      attendanceData[value] = "A";
    });
    notifyListeners();

    _navigationService.navigateWithTransition(
        TakeAttendancePage(
          rollList: data,
          sheetName: sheetName,
        ),
        transition: "fade");
    // log.d(data);
  }

  viewDetails(String sheetName) async {
    var data = await _excelService.getAttendanceDetails(sheetName: sheetName);
    _navigationService.navigateWithTransition(
        ViewAttendance(
          sheetName: sheetName,
          data: data,
        ),
        transition: "fade");
  }

  updateAttendance(key, bool value) {
    attendanceData[key] = value ? "P" : "A";
    notifyListeners();
  }

  selectAll(String sheetName) async {
    List<int> data =
        await _excelService.getSheetDetailsForStaff(sheetName: sheetName);
    data.asMap().forEach((key, value) {
      attendanceData[value] = "P";
    });
    notifyListeners();
  }

  clearAttendance() {
    attendanceData = {};
    notifyListeners();
  }

  updateAndSaveAttendance(String sheetName, List<String> data) async {
    await _excelService.saveAttendance(sheetName: sheetName, data: data);
    attendanceData = {};
    _navigationService.back();
    notifyListeners();
  }

  downloadExcelToDir({@required String sheetName}) async {
    await _excelService.downloadExcelService(sheetName: sheetName);
  }
}
