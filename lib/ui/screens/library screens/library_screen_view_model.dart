import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';

class LibraryScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  //?Navigation Functions
  navigateBack() {
    _navigationService.back();
  }

  
}
