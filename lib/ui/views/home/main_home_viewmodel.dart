import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/user.dart';
import 'package:svuce_app/services/auth_service.dart';

class MainHomeViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final SnackbarService _snackbarService = locator<SnackbarService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future<bool> onWillPop() async {
    await _snackbarService.showCustomSnackBar(
        title: 'Exit',
        duration: Duration(seconds: 5),
        message: 'Are you sure to exit?',
        backgroundColor: surfaceColor,
        mainButton: FlatButton(
          textColor: textPrimaryColor,
          onPressed: () {
            exit(0);
          },
          child: Text("Yes"),
        ));

    return false;
  }

  String getGreeting() {
    var h = DateTime.now().hour;
    if (h < 12) {
      return "Good Morning";
    } else if (h < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  getCurrentUserDetails() {
    User user = _authenticationService.currentUser;
    if (user != null) {
      _currentUser = user;
    }
  }
}