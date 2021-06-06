import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';

class TimeTableDetailWidgetViewModel extends BaseViewModel {
  final log = getLogger("TimeTableDetailWidgetViewModel");
  final NavigationService _navigationService = locator<NavigationService>();
  final TimeTableService _timeTableService = locator<TimeTableService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  bool isShowUpdate = false;
  List<String> weekList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  TimeTable timeTable;
  init(TimeTable refTable) {
    timeTable = refTable;
    notifyListeners();
    makeSorted();
  }

  makeSorted() {
    Map<String, dynamic> tem = timeTable.tojson();
    tem.forEach((key, value) {
      tem[key] = miniSort(value);
    });
    timeTable = TimeTable.fromMap(tem, timeTable.id);
    notifyListeners();
  }

  miniSort(Map<String, String> data) {
    Map<String, String> temp = {};
    var sortedKeys = data.keys.toList()..sort();
    sortedKeys.asMap().forEach((key, value) {
      temp[value] = data[value];
    });
    return temp;
  }

  addSubject(String title, String time, String weekName) async {
    Map<String, dynamic> temp = timeTable.tojson();
    temp[weekName][time] = title;
    timeTable = TimeTable.fromMap(temp, timeTable.id);
    makeSorted();
    _navigationService.back();
    updateIsShownUpdate();
  }

  updateSubject(String key, String weekName, String value) async {
    Map<String, dynamic> temp = timeTable.tojson();
    temp[weekName][value] = key;
    timeTable = TimeTable.fromMap(temp, timeTable.id);
    notifyListeners();
    makeSorted();
    _navigationService.back();
    updateIsShownUpdate();
  }

  deleteSubject(String key, String weekName) async {
    var data = await _bottomSheetService.showBottomSheet(
        title: "Press below button to delete subject",
        description:
            "Check once before deleting subject and it can't be done reverse",
        confirmButtonTitle: "Delete Subject");
    if (data != null && data.confirmed) {
      Map<String, dynamic> temp = timeTable.tojson();
      temp[weekName].remove(key);
      timeTable = TimeTable.fromMap(temp, timeTable.id);
      notifyListeners();
      makeSorted();
      updateIsShownUpdate();
    }
  }

  update() async {
    log.d("Update Started");
    setBusy(true);
    await _timeTableService.updateTimeTable(timeTable);
    updateIsShownUpdate(value: false);

    setBusy(false);
  }

  updateIsShownUpdate({bool value = true}) {
    isShowUpdate = value;
    notifyListeners();
  }
}
