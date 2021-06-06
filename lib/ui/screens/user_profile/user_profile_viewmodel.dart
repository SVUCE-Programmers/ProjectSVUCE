import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/models/user_club/user_club.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

import 'package:svuce_app/core/repositories/user_clubs_repository/user_clubs_repository.dart';

class UserProfileViewModel extends BaseViewModel {
  // Required Services
  final AuthService _authenticationService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final UserClubsRepository _userClubsRepository =
      locator<UserClubsRepository>();

  final log = getLogger('User Profile View Model');
  List<Map<String, dynamic>> socialLinksData = [
    {
      "name": "Youtube",
      "link": "",
      "icon": FlutterIcons.youtube_ant,
      "color": Color(0xFFFF0000)
    },
    {
      "name": "Instagram",
      "link": "",
      "icon": FlutterIcons.instagram_ant,
      "color": Color(0xFF405DE6)
    },
    {
      "name": "Twitter",
      "link": "",
      "icon": FlutterIcons.twitter_ant,
      "color": Color(0xFF1DA1F2)
    },
    {
      "name": "Facebook",
      "link": "",
      "icon": FlutterIcons.facebook_square_ant,
      "color": Color(0xFF4267B2),
    }
  ];

  UserModel user;

  List<UserClub> _userClubs;
  List<UserClub> get userClubs => _userClubs;

  bool get hasUserClubs => _userClubs != null && _userClubs.isNotEmpty;

  init() {
    var currentUser = _authenticationService.currentUser;
    log.d(currentUser);
    if (currentUser != null) {
      user = currentUser;
      getUserClubList(currentUser.email);
    }
  }

  getUserClubList(String userId) {
    setBusy(true);
    _userClubsRepository.getUserClubs(userId).listen((clubsData) {
      List<UserClub> updatedPosts = clubsData;
      print(updatedPosts);
      if (updatedPosts != null && updatedPosts.length > 0) {
        _userClubs = updatedPosts;
        notifyListeners();
      }
    });
    setBusy(false);
  }

  goBack() => _navigationService.back();
}
