import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/core/services/excel%20service/excel_service.dart';
import 'dart:io';

@Singleton(as: ExcelService)
class ExcelServiceImpl implements ExcelService {
  Excel _excel;
  final log = getLogger("ExcelServiceImpl");
  @override
  initForStaffExcel({String excelName}) async {
    var dir = await getExternalStorageDirectory();
    var knockDir = await new Directory('${dir.path}').create(recursive: true);
    File file = File(knockDir.path + "/Attendance/attendance_sheet.xlsx");
    bool isFileExists = await file.exists();
    if (!isFileExists) {
      var excel = Excel.createExcel();
      excel.encode().then((onValue) {
        File((knockDir.path + "/Attendance/attendance_sheet.xlsx"))
          ..createSync(recursive: true)
          ..writeAsBytesSync(onValue);
      });
      _excel = excel;
    } else {
      _excel = Excel.decodeBytes(file.readAsBytesSync());
    }
  }

  @override
  addForStaffExcelSheet({String sheetName}) async {
    try {
      _excel.appendRow("Sheet1", ["S.No", "Roll No"]);
      saveToExcel(sheetName: "Sheet1");
    } catch (e) {}
  }

  @override
  getNumberOfSheetsForStaff({String sheetName}) {
    List<String> temp = [];
    _excel.sheets.forEach((key, value) {
      temp.add(key);
    });
    return temp;
  }

  @override
  getSheetDetailsForStaff({@required String sheetName}) {
    _excel.sheets.forEach((key, value) {
      if (key == sheetName) {
        log.d(value);
      }
    });
  }

  saveToExcel({@required String sheetName}) async {
    var dir = await getExternalStorageDirectory();
    var knockDir = await new Directory('${dir.path}').create(recursive: true);
    _excel.encode().then((onValue) {
      File((knockDir.path + "/Attendance/attendance_sheet.xlsx"))
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });
  }
}
