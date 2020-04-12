import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class SelectUserViewModel extends BaseModel {
  final NavigationService navigationService = locator<NavigationService>();

  gotoStudentlogin() {
    navigationService.navigateTo(LoginViewRoute, arguments: true);
  }

  gotoTeacherLogin() {
    navigationService.navigateTo(LoginViewRoute, arguments: false);
  }

  signInAsGuest() {
    navigationService.navigateTo(HomeViewRoute);
  }
}
