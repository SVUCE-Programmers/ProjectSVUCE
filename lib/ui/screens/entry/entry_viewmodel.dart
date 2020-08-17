import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';

class EntryViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();

  gotoLogin() async {
    await navigationService.replaceWith(Routes.loginViewRoute);
  }
}
