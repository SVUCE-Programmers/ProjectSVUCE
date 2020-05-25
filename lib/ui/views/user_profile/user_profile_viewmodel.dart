import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/user.dart';
import 'package:svuce_app/models/user_club.dart';
import 'package:svuce_app/services/auth_service.dart';
import 'package:svuce_app/services/firestore_service.dart';

class UserProfileViewModel extends BaseViewModel {
  // Required Services
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final FirestoreService _firestoreService = locator<FirestoreService>();

  User user;

  List<UserClub> _userClubs;
  List<UserClub> get userClubs => _userClubs;

  bool get hasUserClubs => _userClubs.isNotEmpty && _userClubs.length > 0;

  init() {
    var currentUser = _authenticationService.currentUser;

    if (currentUser != null) {
      user = currentUser;
      getUserClubList(currentUser.id);
    }
  }

  getUserClubList(String userId) {
    setBusy(true);

    _firestoreService.getUserClubs(userId).listen((clubsData) {
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
