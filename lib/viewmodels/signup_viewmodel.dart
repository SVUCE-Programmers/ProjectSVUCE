import 'package:flutter/material.dart';
import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class SignUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rollNoController = TextEditingController();
  final fullNameController = TextEditingController();

  String buttonText = "Signup";

  Future createUser() async {
    String email = emailController.text;
    String password = passwordController.text;
    String fullName = fullNameController.text;
    String rollNo = rollNoController.text;

    bool isValidated = validateFields(email, password, rollNo, fullName);

    if (!isValidated) {
      buttonText = "Try again";
      await _dialogService.showDialog(
          title: 'Login Failure',
          description: "Please check your details and try again");
      return null;
    }

    var isRollExists = await _firestoreService.isRollNoExists(rollNo);

    if (isRollExists is bool) {
      if (isRollExists) {
        await _dialogService.showDialog(
            title: 'Login Failure', description: "The Roll No. already exists");

        return null;
      }
    } else {
      await _dialogService.showDialog(
          title: 'Login Failure', description: isRollExists);
      return isRollExists;
    }

    //TODO: Do an API Call to check whether email is allowed to register

    setBusy(true);

    var result = await _authenticationService.createStudent(
        fullName: fullName, rollNo: rollNo, email: email, password: password);

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Signup Failure',
          description: 'General signup failure, please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
          title: 'Login Failure', description: result);
    }
  }

  bool validateFields(
      String email, String password, String rollNo, String fullName) {
    if (email == null ||
        password == null ||
        rollNo == null ||
        fullName == null ||
        rollNo.length > 8 ||
        rollNo.length < 8 ||
        fullName.length < 5 ||
        email.length < 5 ||
        password.length < 5 ||
        !email.contains("@")) {
      return false;
    }
    //TODO: Validate Roll No. using Regex
    return true;
  }

  gotoLogin() {
    _navigationService.pop();
  }
}
