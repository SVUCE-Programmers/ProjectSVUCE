import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class ExcelService {

  //?For Attendance
  initForStaffExcel({String excelName});
  addForStaffExcelSheet({String sheetName});
  getNumberOfSheetsForStaff();
  getSheetDetailsForStaff({String sheetName});
  Future<bool> isExcelCreatedForStaff();
  createNewSheet({
    @required String sheetName,
    @required List<int> rollList,
  });

  saveAttendance({@required String sheetName, @required List<String> data});
  getAttendanceDetails({@required String sheetName});
  downloadExcelService({@required String sheetName});
  deleteSheet({@required String sheetName});

  //?General Services
  getDataFromExcelFile({@required File file});
}
