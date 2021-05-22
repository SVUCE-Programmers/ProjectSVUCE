import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/core/mixins/snackbar_helper.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

import 'package:svuce_app/ui/screens/attendance_manager/attendance_view.dart';

class HomeViewModel extends BaseViewModel with SnackbarHelper {
  final AuthService _authenticationService = locator<AuthService>();

  final NavigationService _navigationService = locator<NavigationService>();

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

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
    UserModel user = _authenticationService.currentUser;
    if (user != null) {
      _currentUser = user;
    }
  }

  exploreClubs() {
    _navigationService.navigateTo(Routes.selectClubsView,
        arguments: SelectClubsViewArguments(isSelectClubs: false));
    // Navigations
  }

  viewTimeTable() async {
    await _navigationService.navigateTo(Routes.timeTableView);
  }

  viewAttendance() async {
    await _navigationService.navigateWithTransition(AttendanceView(),
        transition: "fade");
  }

  viewUserProfile() async {
    await _navigationService.navigateTo(Routes.userProfileView);
  }
}
