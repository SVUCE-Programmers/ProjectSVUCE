import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/AppSetup.router.dart';

import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/core/mixins/snackbar_helper.dart';
import 'package:svuce_app/core/models/club/club.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/models/user_club/user_club.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

import 'package:svuce_app/core/repositories/clubs_repository/clubs_repository.dart';
import 'package:svuce_app/core/repositories/user_clubs_repository/user_clubs_repository.dart';
import 'package:svuce_app/core/services/push_notifications/push_notification_service.dart';

class SelectClubsViewModel extends BaseViewModel with SnackbarHelper {
  final log = getLogger("Select Clubs View Model");
  final AuthService _authenticationService = locator<AuthService>();
  final ClubsRepository _clubsRepository = locator<ClubsRepository>();
  final UserClubsRepository _userClubsRepository =
      locator<UserClubsRepository>();
  final NavigationService _navigationService = locator<NavigationService>();
  final PushNotificationService _pushNotifyService =
      locator<PushNotificationService>();
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
  bool isUserClubLoaded = false;
  List<UserClub> userClubList = [];

  List<Club> _clubList;
  List<bool> flags;
  List<Club> get clubs => _clubList;

  getClubListOnce() {
    setBusy(true);

    _clubsRepository.getClubs().listen((postsData) {
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
    UserModel user = _authenticationService.currentUser;
    if (user == null) {
      return null;
    }
    try {
      var selectedClub = clubs[index];
      await _clubsRepository.followClub(selectedClub.id, user.id);
      await _userClubsRepository.addClubToUser(
          UserClub(
              id: selectedClub.id,
              clubLogo: selectedClub.clubLogo,
              name: selectedClub.name),
          user.id);
      await _pushNotifyService.subscribe(clubs[index].id);
      flags[index] = true;
      setBusy(false);
    } catch (e) {
      showErrorMessage(
        title: commonErrorTitle,
        message: commonErrorInfo,
      );
    }
  }

  gotoHome() {
    _navigationService.navigateTo(Routes.mainView);
  }

  addFlags(int length) {
    flags = [];
    for (var i = 0; i < length; i++) {
      flags.add(false);
    }
  }

  navigateBack() {
    _navigationService.back();
  }

  init(bool isSelectClubs) {
    if (isSelectClubs) {
      getClubListOnce();
    } else {
      getClubListOnce();
      getUserClubs();
    }
  }

  getUserClubs() {
    _userClubsRepository
        .getUserClubs(_firebaseAuth.currentUser.uid)
        .listen((event) {
      if (event != null) {
        userClubList = event;
        log.v("At get User Clubs Method:$event");
      }
      isUserClubLoaded = true;
      notifyListeners();
    });
  }
}
