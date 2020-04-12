import 'dart:io';

import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/models/user.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  User _currentUser;
  User get currentUser => _currentUser;

  getCurrentUserDetails() {
    User user = _authenticationService.currentUser;

    if (user != null) {
      _currentUser = user;
    }
  }

  Future<bool> onWillPop() async {
    var isPressed = await _dialogService.showDialog(
        title: 'Exit',
        description: 'Are you sure to exit?',
        buttonTitle: 'Yes');

    if (isPressed.confirmed) {
      exit(0);
    }

    return false;
  }

  Future signOut() async {
    var isPressed = await _dialogService.showDialog(
        title: 'Logout',
        description: 'Are you sure to logout',
        buttonTitle: 'Yes');

    if (isPressed.confirmed) {
      await _authenticationService.signOut().then((res) async {
        _navigationService.navigateTo(SelectUserViewRoute);
      });
    }

    return null;
  }
}
