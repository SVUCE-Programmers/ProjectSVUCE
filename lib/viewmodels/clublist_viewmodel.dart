import 'package:svuce_app/locator.dart';
import 'package:svuce_app/models/club.dart';
import 'package:svuce_app/models/user.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/base_auth.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class ClubListViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<BaseAuth>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

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

  followClub(String clubId) async {
    if (clubId == null) {
      return null;
    }

    User user = _authenticationService.currentUser;

    if (user == null) {
      return null;
    }
    //TODO: Handle Exception
    await _firestoreService.followClub(clubId, user);
  }
}
