import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/services/auth_service.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  final emailTextEditingController = TextEditingController();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  void resetPassword() async {
    bool result = _formKey.currentState.validate();

    if (!result) {
      return null;
    }

    setBusy(true);

    var resetPasswordResult = await _authenticationService
        .resetPassword(emailTextEditingController.text);

    if (resetPasswordResult is String) {
      _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 5),
        title: "OOPS!",
        message: 'Check your details and try again',
      );
    } else {
      _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 5),
        title: "Done",
        message:
            'We have successfully sent you an email with reset password link',
      );
    }

    setBusy(false);
  }

  String validateEmail(String email) {
    RegExp reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (reg.hasMatch(email)) {
      return null;
    }
    return "Email is not valid";
  }
}
