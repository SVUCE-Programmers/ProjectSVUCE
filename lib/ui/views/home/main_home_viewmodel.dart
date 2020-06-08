import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/models/user/user.dart';
import 'package:svuce_app/services/auth/auth_service.dart';

import 'package:svuce_app/services/auth/auth_service_impl.dart';
import 'package:svuce_app/ui/views/attendance_manager/attendance_view.dart';

class MainHomeViewModel extends BaseViewModel {
  final AuthServiceImpl _authenticationService =
      locator<AuthService>();

  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future<bool> onWillPop() async {
    await _snackbarService.showCustomSnackBar(
        title: confirmExitInfo,
        duration: Duration(seconds: 5),
        message: confirmExitMessage,
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

  exploreClubs() {
    _navigationService.navigateTo(Routes.selectClubsViewRoute,
        arguments: SelectClubsViewArguments(isSelectClubs: false));
    // Navigations
  }

  viewTimeTable() async {
    await _navigationService.navigateTo(Routes.timeTableViewRoute);
  }

  viewAttendance() async {
    await _navigationService.navigateWithTransition(AttendanceView(),
        transition: "fade");
  }

  viewUserProfile() async {
    await _navigationService.navigateTo(Routes.userProfileViewRoute);
  }
}
