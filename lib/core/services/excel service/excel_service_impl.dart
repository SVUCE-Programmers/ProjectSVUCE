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

  // ? Functions For Staff
  @override
  initForStaffExcel({String excelName}) async {
    var dir = await getExternalStorageDirectory();
    var knockDir = await new Directory('${dir.path}').create(recursive: true);
    File file = File(knockDir.path + "/Attendance/attendance_sheet.xlsx");
    bool isFileExists = await file.exists();
    if (!isFileExists) {
      _excel = Excel.createExcel();
      saveToExcel(sheetName: "");
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
  getNumberOfSheetsForStaff() {
    List<String> temp = [];
    _excel.sheets.forEach((key, value) {
      temp.add(key);
    });
    return temp;
  }

  @override
  getSheetDetailsForStaff({@required String sheetName}) {
    List<int> temp = [];
    _excel.sheets.forEach((key, value) {
      if (key == sheetName) {
        for (int i = 1; i < value.maxRows; i++) {
          temp.add(value
              .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i))
              .value);
        }
      }
    });
    return temp;
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

  @override
  Future<bool> isExcelCreatedForStaff() async {
    var dir = await getExternalStorageDirectory();
    var knockDir = await new Directory('${dir.path}').create(recursive: true);
    File file = File(knockDir.path + "/Attendance/attendance_sheet.xlsx");
    bool isFileExists = await file.exists();
    if (isFileExists) {
      return true;
    } else {
      return false;
    }
  }

  @override
  createNewSheet({String sheetName, List<int> rollList}) async {
    bool isExists = await isExcelCreatedForStaff();
    if (!isExists) {
      _excel = Excel.createExcel();
      _excel.rename("Sheet1", sheetName);
    }
    List<int> sNo = List.generate(rollList.length, (index) => index + 1);
    _excel.appendRow("$sheetName", ["S.No", "Roll No"]);
    for (int s in sNo) {
      _excel.appendRow("$sheetName", [s, rollList[s - 1]]);
    }
    saveToExcel(sheetName: sheetName);
  }

  @override
  saveAttendance({String sheetName, List<String> data}) async {
    _excel.sheets.forEach((key, value) {
      if (key == sheetName) {
        int maxCol = value.maxCols;
        data.asMap().forEach((key, mapValue) {
          value
              .cell(CellIndex.indexByColumnRow(
                  columnIndex: maxCol, rowIndex: key))
              .value = mapValue;
        });
      }
    });
    saveToExcel(sheetName: sheetName);
  }
}
