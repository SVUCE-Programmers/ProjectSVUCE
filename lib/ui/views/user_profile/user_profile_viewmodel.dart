import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/user/user.dart';
import 'package:svuce_app/models/user_club/user_club.dart';
import 'package:svuce_app/services/auth/auth_service.dart';

import 'package:svuce_app/services/auth/auth_service_impl.dart';
import 'package:svuce_app/services/firestore/user_club_service.dart';

class UserProfileViewModel extends BaseViewModel {
  // Required Services
  final AuthServiceImpl _authenticationService =
      locator<AuthService>();

  final UserClubService _userClubService = locator<UserClubService>();

  User user;

  List<UserClub> _userClubs;
  List<UserClub> get userClubs => _userClubs;

  bool get hasUserClubs => _userClubs != null && _userClubs.isNotEmpty;

  init() {
    var currentUser = _authenticationService.currentUser;

    if (currentUser != null) {
      user = currentUser;
      getUserClubList(currentUser.id);
    }
  }

  getUserClubList(String userId) {
    setBusy(true);

    _userClubService.getUserClubs(userId).listen((clubsData) {
      List<UserClub> updatedPosts = clubsData;

      print(updatedPosts);

      if (updatedPosts != null && updatedPosts.length > 0) {
        _userClubs = updatedPosts;
        notifyListeners();
      }
    });

    setBusy(false);
  }
}
