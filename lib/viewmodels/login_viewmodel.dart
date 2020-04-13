import 'package:flutter/material.dart';
import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/base_auth.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

//Note: When the dialogs are called they completely come from a seperate page. So when writing test
// make sure to remove dialogs and add notifyListeners for a string to see the error.

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authenticationService =
      locator<BaseAuth>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String buttonText = "Signin";

  Future login() async {
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

    var result = await _authenticationService.loginUser(
        email: email, password: password);

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        buttonText = "Try again";
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure, please try again later',
        );
      }
    } else {
      buttonText = "Try again";
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

  gotoCreateAccount() {
    _navigationService.navigateTo(SignUpViewRoute);
  }
}
