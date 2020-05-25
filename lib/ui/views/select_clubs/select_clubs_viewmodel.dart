import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/models/club.dart';
import 'package:svuce_app/models/user.dart';
import 'package:svuce_app/models/user_club.dart';
import 'package:svuce_app/services/auth_service.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:svuce_app/services/push_notification_service.dart';

class SelectClubsViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final PushNotificationService _pushNotifyService =
      locator<PushNotificationService>();

  List<Club> _clubList;
  List<bool> flags;
  List<Club> get clubs => _clubList;

  getClubListOnce() {
    setBusy(true);

    _firestoreService.getClubListStream().listen((postsData) {
      List<Club> clubList = postsData;
      if (clubList != null && clubList.length > 0) {
        _clubList = clubList;
        addFlags(_clubList.length);
        notifyListeners();
      }

      setBusy(false);
    });
  }

  Future followClub(int index) async {
    if (index == null) {
      return null;
    }

    setBusy(true);

    User user = _authenticationService.currentUser;

    if (user == null) {
      return null;
    }

    try {
      var selectedClub = clubs[index];

      await _firestoreService.followClub(selectedClub.id, user);

      await _firestoreService.addClubToUser(
          UserClub(
              clubId: selectedClub.id,
              clubLogo: selectedClub.clubLogo,
              name: selectedClub.name),
          user.id);

      await _pushNotifyService.subscribe(clubs[index].topicId);

      flags[index] = true;

      setBusy(false);
    } catch (e) {
      _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 5),
        icon: Icon(
          infoIcon,
          color: errorColor,
        ),
        backgroundColor: surfaceColor,
        title: commonErrorTitle,
        message: commonErrorInfo,
      );
    }
  }

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

  gotoHome() {
    _navigationService.navigateTo(Routes.homeViewRoute);
  }

  addFlags(int length) {
    flags = [];
    for (var i = 0; i < length; i++) {
      flags.add(false);
    }
  }
}
