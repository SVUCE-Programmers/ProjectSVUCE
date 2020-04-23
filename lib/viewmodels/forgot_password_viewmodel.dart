import 'package:flutter/material.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/base_auth.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class ForgotViewModel extends BaseModel {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  final emailTextEditingController = TextEditingController();
  final AuthenticationService _authenticationService = locator<BaseAuth>();
  final DialogService _dialogService = locator<DialogService>();

  void resetPassword() async {
    bool result = _formKey.currentState.validate();

    if (!result) {
      return null;
    }

    setBusy(true);

    var resetPasswordResult = await _authenticationService
        .resetPassword(emailTextEditingController.text);

    if (resetPasswordResult is String) {
      _dialogService.showDialog(
          title: 'Check Your Details',
          description: resetPasswordResult,
          buttonTitle: "OKAY",
          cancelTitle: '');
    } else {
      _dialogService.showDialog(
          title: 'Done',
          description:
              'We have successfully sent you an email with reset password link',
          buttonTitle: 'Okay',
          cancelTitle: '');
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
