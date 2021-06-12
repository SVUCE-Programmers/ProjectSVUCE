import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';

class ClubDetailsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  navigateBack() {
    _navigationService.back();
  }
}
