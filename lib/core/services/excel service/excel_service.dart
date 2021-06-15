import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/core/models/student_add_Data_body.dart';

@lazySingleton
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
  Future<List<List<Data>>> getAttendanceDetails({@required String sheetName});
  downloadExcelService({@required String sheetName,bool isDownload=false});
  deleteSheet({@required String sheetName});

  //?General Services
  List<StudentAddDataBody> getDataFromExcelFile({@required File file});
}
