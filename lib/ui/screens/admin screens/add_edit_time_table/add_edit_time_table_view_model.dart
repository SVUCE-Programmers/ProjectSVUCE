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

  List<String> getAllYears() {
    return timeTableList.map((e) => e.id).toList();
  }

  addNewClass(String year) async {
    setBusy(true);
    await _timeTableService.addNewYear(year);
    setBusy(false);
  }

  deleteClass(String year) async {
    setBusy(true);
    await _timeTableService.deleteClass(year);
    setBusy(false);
  }

  //?Navigation Services
  navigateBack() {
    _navigationService.back();
  }
}
