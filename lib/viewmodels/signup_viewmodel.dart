import 'package:flutter/material.dart';
import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class SignUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String buttonText = "Signup";

  Future createUser() async {
    String email = emailController.text;
    String password = passwordController.text;

    bool isValidated = validateFields(email, password);

    if (!isValidated) {
      buttonText = "Try again";
      await _dialogService.showDialog(
          title: 'Login Failure',
          description: "Please check your details and try again");
      return null;
    }

    setBusy(true);

    //TODO: Do an API Call to check whether email is allowed to register

    var result = await _authenticationService.createStudent(
        email: email, password: password);

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

  bool validateFields(String email, String password) {
    if (email == null ||
        password == null ||
        email.length < 5 ||
        password.length < 5 ||
        !email.contains("@")) {
      return false;
    }

    return true;
  }

  gotoLogin() {
    _navigationService.pop();
  }
}
