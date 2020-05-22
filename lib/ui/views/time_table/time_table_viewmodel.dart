import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/services/api_service.dart';
import 'package:svuce_app/services/auth_service.dart';
import 'package:svuce_app/services/hive_service.dart';
import 'package:svuce_app/ui/views/time_table/utils.dart';

class TimeTableViewModel extends BaseViewModel {
  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  final SnackbarService snackbarService = locator<SnackbarService>();
  final TimeTableService timeTableService = locator<TimeTableService>();

  List<TimeTable> _timeTableItems;
  List<TimeTable> get timeTable => _timeTableItems;

  // getTimeTable() async {
  //   setBusy(true);

  //   var result = await timeTableService.getTimeTable();

  //   setBusy(false);

  //   if (result is String) {
  //     //TODO: Show Error Message
  //     return;
  //   }

  //   _timeTableItems = (result as List);
  //   notifyListeners();
  // }

  changeCurrentDay(int index) {
    currentDay = weekDates[index];
    currentIndex = index;
    notifyListeners();
  }

  List<int> weekDates = generateCurrentWeekDays();

  int currentDay = DateTime.now().day;
  int currentIndex;

  init() async {
    currentIndex = weekDates.indexOf(DateTime.now().day);
    List<TimeTable> items = timeTableService.streamData;

    if (items != null) {
      _timeTableItems = items;
    }
  }

  List<TimeTable> getCurrentDayTimeTable() {
    var currentWeekDay = weekDays[currentIndex];
    var result =
        _timeTableItems.where((element) => element.day == currentWeekDay);
    return result.toList();
  }
}
