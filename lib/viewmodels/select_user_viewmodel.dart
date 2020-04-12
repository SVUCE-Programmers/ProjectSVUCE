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
    navigationService.navigateTo(LoginViewRoute, arguments: true);
  }

  gotoTeacherLogin() {
    navigationService.navigateTo(LoginViewRoute, arguments: false);
  }

  signInAsGuest() {
    navigationService.navigateTo(HomeViewRoute);
  }

  Future<bool> onWillPop() async {
    var isPressed = await dialogService.showDialog(
        title: 'Exit',
        description: 'Are you sure to exit?',
        buttonTitle: 'Yes');

    if (isPressed.confirmed) {
      exit(0);
    }

    return false;
  }
}
