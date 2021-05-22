import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';

class EditTimeTableViewModel extends BaseViewModel {
  final log = getLogger("EditTimeTableViewModel");

  final NavigationService _navigationService = locator<NavigationService>();

  init() {}

  //?Navigation Services
  navigateBack() {
    _navigationService.back();
  }
}
