import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/models/graph.dart';
import 'package:svuce_app/services/api_service.dart';
import 'package:svuce_app/services/auth_service.dart';
import 'package:svuce_app/services/hive_service.dart';
import 'package:svuce_app/ui/views/action_center/dataset.dart';

class ActionCenterViewModel extends BaseViewModel {
  final TimeTableService timeTableService = locator<TimeTableService>();
  final APIService apiService = locator<APIService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();
  final SnackbarService snackbarService = locator<SnackbarService>();
  final HiveService hiveService = locator<HiveService>();

  List<TimeTable> timeTableData = List<TimeTable>();

  List<double> _percentages = [];
  List<double> get percentages => _percentages;

  List<String> _subjects = [];
  List<String> get subjects => _subjects;

  getPercentage() async {
    bool exists = await hiveService.isExists(boxName: "Attendance");
    if (exists) {
      setBusy(true);
      List<dynamic> dummy = await hiveService.getBoxes("Attendance");
      for (var item in dummy) {
        if (item.total != 0) {
          _percentages.add(((item.present) / (item.total)));
        } else {
          _percentages.add(0);
        }

        _subjects.add(item.subject);
      }
      setBusy(false);
    } else {
      setBusy(true);
      final openBox = await Hive.openBox("Attendance");
      List<dynamic> temp = await hiveService.getBoxes<TimeTable>("TimeTable");
      List<String> dummy = [];
      for (var item in temp) {
        if (item.year == authenticationService.getStudentPresentYear()) {
          Attendance atitem = Attendance(
              subject: item.className,
              present: 0,
              absent: 0,
              total: 0,
              lastUpdated: "Nothing");
          if (!dummy.contains(atitem.subject)) {
            openBox.add(atitem);
            dummy.add(atitem.subject);
            _subjects.add(atitem.subject);
            atitem.total==0?_percentages.add(0.0):_percentages.add((atitem.present/atitem.total).toDouble());
          }
        }
      }
      setBusy(false);
    }

    getGraph();
  }

  getGraph() {
    DataSet dataSet = DataSet(percentages);
    Graph graph = Graph([dataSet], "", "%");
    graph = Graph([dataSet], "", "\%");
    graph.domainStart = 0;
    graph.domainEnd = 5;
    graph.rangeStart = 0;
    graph.rangeEnd = 10;
    graph.selectedDataPoint = 1;
    return graph;
  }

  getTimeTable() async {
    getPercentage();

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

