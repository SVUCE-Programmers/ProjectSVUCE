import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  goBack() {
    _navigationService.back();
  }

  changePassword() async {
    if (passController.text == confirmPassController.text) {
      setBusy(true);
      bool res = await _authService.changePassword("${passController.text}");
      if (res) {
        passController.text = "";
        confirmPassController.text = "";
      }

      setBusy(false);
    }
  }
}
