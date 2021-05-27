import 'package:flutter/cupertino.dart';

abstract class ExcelService {
  initForStaffExcel({String excelName});
  addForStaffExcelSheet({String sheetName});
  getNumberOfSheetsForStaff();
  getSheetDetailsForStaff({String sheetName});
  Future<bool> isExcelCreatedForStaff();
  createNewSheet({
    @required String sheetName,
    @required List<int> rollList,
  });
}
