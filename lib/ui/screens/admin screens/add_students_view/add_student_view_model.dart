import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/student_add_Data_body.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/services/excel%20service/excel_service.dart';
import 'package:svuce_app/core/services/share%20service/share_service.dart';
import 'package:svuce_app/core/services/student%20services/student_service.dart';
import 'package:svuce_app/core/utils/file_picker.dart';

class AddStudentViewModel extends BaseViewModel {
  final log = getLogger("Add Student View Model");
  int index = 0;
  List<UserModel> userModelList = [];
  final NavigationService _navigationService = locator<NavigationService>();
  final TextEditingController userController = TextEditingController();
  final FilePickerUtil _filePickerUtil = FilePickerUtil();
  final ExcelService _excelService = locator<ExcelService>();
  final StudentService _studentService = locator<StudentService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final ShareService _shareService = locator<ShareService>();
  List<StudentAddDataBody> data = [];
  File excelFile;
  bool isStudentsData = true;

  changeType() {
    isStudentsData = !isStudentsData;
    notifyListeners();
  }

  changeIndex(int value) {
    index = value;
    notifyListeners();
  }

  clearTextField() {
    userController.text = "";
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

  searchUser(bool value) async {
    setBusy(true);

    _studentService
        .getStudentsByQuery(userController.text, value)
        .listen((event) {
      log.wtf(event);
      if (event != null) {
        userModelList = event ?? [];
      }
      setBusy(false);
    });
  }

  deleteStudent(UserModel userModel) async {
    var res = await _bottomSheetService.showBottomSheet(
        title: "Are you sure want to delete?",
        confirmButtonTitle: "Delete Student",
        description: "You can't undo the action, please check once");
    if (res != null && res.confirmed) {
      setBusy(true);
      var result = await _studentService.deleteStudent(userModel.email);
      setBusy(false);

      if (result) {
        showToast("Deleted User Successfully",
            backgroundColor: Colors.green,
            textPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 10));
      } else {
        showToast("Failed to delete user");
      }
    }
  }

  shareStudent(UserModel userModel) async {
    String data = "";
    userModel.toMap().forEach((key, value) {
      if (key != "id")
        data += key.toString().toUpperCase() + " : " + "$value" + "\n";
    });
    _shareService.shareData(
        title: "${userModel.fullName} Data", description: data);
  }
}
