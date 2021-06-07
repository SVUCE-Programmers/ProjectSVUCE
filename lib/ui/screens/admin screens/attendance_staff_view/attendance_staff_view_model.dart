import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/excel%20service/excel_service.dart';
import 'take_attendance.dart';
import 'view_attendance.dart';

class AttendanceStaffViewModel extends BaseViewModel {
  final log = getLogger("AttendanceStaff ViewModel");
  final NavigationService _navigationService = locator<NavigationService>();
  final ExcelService _excelService = locator<ExcelService>();

  List<String> excelSheets = [];
  bool isExcelCreated = false;

  init() async {
    isExcelCreated = await _excelService.isExcelCreatedForStaff();
    log.i("IS Excel Created:$isExcelCreated");
    if (isExcelCreated) {
      await _excelService.initForStaffExcel();
      excelSheets = await _excelService.getNumberOfSheetsForStaff();
      notifyListeners();
    }
  }

  navigateBack() {
    _navigationService.back();
  }

  addNewSheetForStaff({
    String sheetName,
    String totalCount,
    List<String> excludingNo,
  }) async {
    log.d(
        "Sheet Name iS:$sheetName and totalCount is:$totalCount and excluding List is:$excludingNo ");
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

  deleteSheet({@required String sheetName}) async {
    await _excelService.deleteSheet(sheetName: sheetName);
    excelSheets = await _excelService.getNumberOfSheetsForStaff();
    isExcelCreated = await _excelService.isExcelCreatedForStaff();
    notifyListeners();
  }
}
