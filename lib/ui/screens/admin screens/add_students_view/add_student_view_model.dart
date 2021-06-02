import 'dart:io';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/student_add_Data_body.dart';
import 'package:svuce_app/core/services/excel%20service/excel_service.dart';
import 'package:svuce_app/core/services/student%20services/student_service.dart';
import 'package:svuce_app/core/utils/file_picker.dart';

class AddStudentViewModel extends BaseViewModel {
  final log = getLogger("Add Student View Model");
  final NavigationService _navigationService = locator<NavigationService>();
  final FilePickerUtil _filePickerUtil = FilePickerUtil();
  final ExcelService _excelService = locator<ExcelService>();
  final StudentService _studentService = locator<StudentService>();
  List<StudentAddDataBody> data = [];
  File excelFile;
  bool isStudentsData = true;

  changeType() {
    isStudentsData = !isStudentsData;
    notifyListeners();
  }

  init() {}

  pickExcel() async {
    var data = await _filePickerUtil.pickExcelFile();
    if (data != null) {
      excelFile = data;
      getDataFromExcel();
    }
  }

  //?Navigation Services
  navigateBack() {
    _navigationService.back();
  }

  getDataFromExcel() {
    data = _excelService.getDataFromExcelFile(file: excelFile) ?? [];
    notifyListeners();
  }

  saveUserData() async {
    setBusy(true);
    await _studentService.addStudentDataToFirebase(data);
    setBusy(false);
  }

  removeFile() async {
    excelFile = null;
    data = [];
    notifyListeners();
  }
}
