import 'dart:io';

import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/models/club.dart';
import 'package:svuce_app/models/user.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/base_auth.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/services/push_notification_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class ClubListViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<BaseAuth>();
  final DialogService _dialogService = locator<DialogService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final PushNotificationService _pushNotifyService =
      locator<PushNotificationService>();

  List<Club> _clubList;
  List<Club> get clubs => _clubList;

  getClubListOnce() {
    setBusy(true);

    _firestoreService.getClubListStream().listen((postsData) {
      List<Club> clubList = postsData;
      if (clubList != null && clubList.length > 0) {
        _clubList = clubList;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  followClub(int index) async {
    if (index == null) {
      return null;
    }

    setBusy(true);

    User user = _authenticationService.currentUser;

    if (user == null) {
      return null;
    }

    try {
      await _firestoreService.followClub(clubs[index].id, user);

      await _pushNotifyService.subscribe(clubs[index].topicId);

      setBusy(false);
    } catch (e) {
      _dialogService.showConfirmationDialog(
          title: "Try again",
          description: "Just a normal error, try again after some time",
          confirmationTitle: "Okay");
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

  gotoHome() {
    _navigationService.navigateTo(HomeViewRoute);
  }
}
