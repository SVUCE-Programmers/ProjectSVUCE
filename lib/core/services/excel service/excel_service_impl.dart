import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/core/models/student_add_Data_body.dart';
import 'package:svuce_app/core/services/excel%20service/excel_service.dart';
import 'dart:io';

import 'package:svuce_app/core/services/permission_service.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/ui/screens/main/consumers/imports.dart';

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
    List<int> bytes = _excel.encode();

    File((knockDir.path + "/Attendance/attendance_sheet.xlsx"))
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes);
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

  @override
  Future<List<List<Data>>> getAttendanceDetails({String sheetName}) async {
    List<List<Data>> resultData = [];
    _excel.sheets.forEach((key, value) {
      if (key == sheetName) {
        List<List<Data>> data = value.rows;
        resultData = data;
      }
    });
    return resultData;
  }

  @override
  downloadExcelService({String sheetName, bool isDownload = false}) async {
    PermissionService _permissionService = PermissionService();
    bool permissionResult = await _permissionService.requestStoragePermission();
    if (permissionResult) {
      List<String> sheetList = [];

      _excel.sheets.forEach((key, value) {
        sheetList.add(key);
      });
      Excel downloadExcel = _excel;
      for (String s in sheetList) {
        if (s != sheetName) {
          downloadExcel.delete(s);
        }
      }
      if (isDownload) {
        Directory downloadsDirectory =
            await DownloadsPathProvider.downloadsDirectory;
        String path = downloadsDirectory.path +
            "/Svuce/Staff_Attendance/attendance_${DateTimeUtils().getWholeDate(DateTime.now().millisecondsSinceEpoch)}.xlsx";
        List<int> bytes = _excel.encode();

        File(path)
          ..createSync(recursive: true)
          ..writeAsBytesSync(bytes);
      } else {
        var dir = await getExternalStorageDirectory();
        var knockDir =
            await new Directory('${dir.path}').create(recursive: true);
        String path = knockDir.path + "/Sent/attendance.xlsx";
        List<int> bytes = _excel.encode();

        File(path)
          ..createSync(recursive: true)
          ..writeAsBytesSync(bytes);
        Share.shareFiles([path],
            subject: "Attendance",
            text:
                "Generated On ${DateTimeUtils().getWholeDate(DateTime.now().millisecondsSinceEpoch)}");
      }
    }
  }

  @override
  deleteSheet({String sheetName}) async {
    List<String> temp = getNumberOfSheetsForStaff();
    if (temp != null && temp.length == 1) {
      var dir = await getExternalStorageDirectory();
      var knockDir = await new Directory('${dir.path}').create(recursive: true);
      File file = File(knockDir.path + "/Attendance/attendance_sheet.xlsx");
      bool isFileExists = await file.exists();
      if (isFileExists) {
        file.delete();
      }
    } else {
      _excel.delete(sheetName);
      saveToExcel(sheetName: sheetName);
    }
  }

  @override
  List<StudentAddDataBody> getDataFromExcelFile({File file}) {
    List<StudentAddDataBody> data = [];
    var bytes = file.readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    bool canAdd = false;
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table].rows) {
        if (canAdd) {
          data.add(StudentAddDataBody.getFromExcel(row));
        }
        canAdd = true;
      }
    }
    return data;
  }

  @override
  downloadExcelSample() async {
    try {
      Excel tempExcel;
      tempExcel = Excel.createExcel();
      tempExcel.appendRow(
          "User Data", ["Name", "Roll No", "Gender", "Email", "Phone Number"]);
      tempExcel.delete("Sheet1");
      PermissionService _permissionService = PermissionService();
      bool permissionResult =
          await _permissionService.requestStoragePermission();

      if (permissionResult) {
        Directory downloadsDirectory =
            await DownloadsPathProvider.downloadsDirectory;
        String path =
            downloadsDirectory.path + "/Svuce/Staff_Attendance/sample.xlsx";
        List<int> bytes = tempExcel.encode();
        File(path)
          ..createSync(recursive: true)
          ..writeAsBytesSync(bytes);
      }
      showToast("Downloaded Successfully",
          backgroundColor: Colors.green.withOpacity(0.2),
          radius: 8,
          textPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          textStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green));
    } catch (e) {
      log.e(e);
    }
  }
}
