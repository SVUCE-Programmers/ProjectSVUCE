import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/services/api_service.dart';
import 'package:svuce_app/services/auth_service.dart';

class ActionCenterViewModel extends BaseViewModel {
  final TimeTableService timeTableService = locator<TimeTableService>();
  final APIService apiService = locator<APIService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();
  final SnackbarService snackbarService = locator<SnackbarService>();

  List<TimeTable> timeTableData = List<TimeTable>();

  getTimeTable() async {
    var result = await timeTableService.getTimeTable();

    if (result is bool) {
      if (result) {
        List<TimeTable> items = timeTableService.getCurrentDayClasses();

        if (items != null) {
          timeTableData = items;
          notifyListeners();
        }
      }
    }
  }
}
