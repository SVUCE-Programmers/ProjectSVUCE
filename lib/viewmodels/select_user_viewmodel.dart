import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class SelectUserViewModel extends BaseModel {
  final NavigationService navigationService = locator<NavigationService>();

  gotoStudentlogin() {
    //TODO: Navigate to student login
  }

  gotoTeacherLogin() {
    //TODO: Navigate to Teacher login
  }

  signInAsGuest() {
    //TODO: Navigate to Homepage
  }
}
