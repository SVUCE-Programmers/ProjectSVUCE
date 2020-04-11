import 'package:flutter/foundation.dart';
import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String buttonText = "Signin";

  Future login({@required String email, @required String password}) async {
    setBusy(true);

    var result = await _authenticationService.loginAsStudent(
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
}
