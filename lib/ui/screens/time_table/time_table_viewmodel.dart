import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/ui/screens/admin screens/add_edit_time_table/add_edit_time_table.dart';

class TimeTableViewModel extends BaseViewModel {
  final log = getLogger("TimeTableViewModel");
  final TimeTableService timeTableService = locator<TimeTableService>();
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  TimeTable timeTable;
  bool get hasAdminAccess => _authService.hasAdminAccess;

  changeCurrentDay(int index) {
    currentDay = weekDates[index];
    currentIndex = index;
    notifyListeners();
  }

  List<int> weekDates = generateCurrentWeekDays();

  int currentDay = DateTime.now().day;
  int currentIndex;

  init() async {
    log.wtf(weekDates);
    currentIndex = weekDates.indexOf(DateTime.now().day);
    timeTableService.getTimeTable("117060").listen((event) {
      timeTable = event;
      notifyListeners();
    });
  }

  //?Navigation Services
  navigateBack() {
    _navigationService.back();
  }

  navigateToEditTimeTable() {
    _navigationService.navigateWithTransition(AddEditTimeTableView(),
        transition: "rightToLeftWithFade",
        duration: Duration(milliseconds: 700));
  }

  Map<String, String> getTimeTable() {
    switch (currentDay + 1) {
      case 1:
        return timeTable.monday;
      case 2:
        return timeTable.tuesday;
      case 3:
        return timeTable.wednesday;
      case 4:
        return timeTable.thursday;
      case 5:
        return timeTable.friday;
      case 6:
        return timeTable.saturday;
      case 7:
        return {};
      default:
        return {};
    }
  }
}
