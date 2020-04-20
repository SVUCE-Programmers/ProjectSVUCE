import 'dart:io';

import 'package:flutter/material.dart';
import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/models/user.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/base_auth.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/ui/widgets/home_spotlight_item.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<BaseAuth>();
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
        cancelTitle: 'No',
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
        cancelTitle: 'No',
        buttonTitle: 'Yes');

    if (isPressed.confirmed) {
      await _authenticationService.signOut().then((res) async {
        _navigationService.navigateTo(SelectUserViewRoute);
      });
    }

    return null;
  }
  getUpcoming(){
    setBusy(true);
    //  _firestoreService.listenToUpcomingData().listen((feedData) {
    //   setBusy(false);
    // });
  }
  getGridMenu(){
    return Container(
        height: 200,
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            SpotlightItem(icon: Icons.group, name: "Clubs"),
            SpotlightItem(icon: Icons.check_box_outline_blank, name: "Faculty"),
            SpotlightItem(icon: Icons.settings_input_antenna, name: "Announcements"),
            SpotlightItem(icon: Icons.timeline, name: "Time table"),
            SpotlightItem(icon: Icons.assignment_turned_in, name: "Attendance"),
            SpotlightItem(icon: Icons.calendar_today, name: "Calendar Events"),
            SpotlightItem(icon: Icons.map, name: "About College"),
            SpotlightItem(icon: Icons.account_balance, name: "About App")
          ],
        )
      );
  }

}
