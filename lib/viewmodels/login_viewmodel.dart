import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future login({bool success = true}) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: 'Failed Login dude!!',
      );
    } else {
      _navigationService.navigateTo(HomeViewRoute);
    }

    setBusy(false);
  }
}
