import 'dart:io';

import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class SelectUserViewModel extends BaseModel {
  final NavigationService navigationService = locator<NavigationService>();
  final DialogService dialogService = locator<DialogService>();

  gotoStudentlogin() {
    navigationService.navigateTo(SignUpViewRoute);
  }

  gotoTeacherLogin() {
    navigationService.navigateTo(LoginViewRoute, arguments: false);
  }

  signInAsGuest() {
    //TODO: Sign in as guest
    navigationService.navigateTo(HomeViewRoute);
  }

  Future<bool> onWillPop() async {
    var isPressed = await dialogService.showDialog(
        title: 'Exit',
        description: 'Are you sure to exit?',
        cancelTitle: 'No',
        buttonTitle: 'Yes');

    if (isPressed.confirmed) {
      exit(0);
    }

    return false;
  }
}
