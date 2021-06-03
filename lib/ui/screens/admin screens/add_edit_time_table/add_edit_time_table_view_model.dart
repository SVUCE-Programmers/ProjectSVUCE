import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';

class AddEditTimeTableViewModel extends BaseViewModel {
  final log = getLogger("Add Edit TimeTable View Model");
  final NavigationService _navigationService = locator<NavigationService>();
  final TimeTableService _timeTableService = locator<TimeTableService>();
  List<TimeTable> timeTableList = [];

  getTimeTableStream() {
    setBusy(true);
    _timeTableService.getAllTimeTable().listen((event) {
      timeTableList = event ?? [];
      setBusy(false);
    });
  }

  //?Navigation Services
  navigateBack() {
    _navigationService.back();
  }
}
