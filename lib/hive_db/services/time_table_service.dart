import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';
import 'package:svuce_app/services/api/api_service.dart';
import 'package:svuce_app/services/api/api_service_impl.dart';
import 'package:svuce_app/services/auth/auth_service.dart';

import 'package:svuce_app/services/auth/auth_service_impl.dart';
import 'package:svuce_app/services/auth/auth_service_impl.dart';
import 'package:svuce_app/ui/views/time_table/utils.dart';

@lazySingleton
class TimeTableService {
  final HiveService hiveService = locator<HiveService>();
  final APIServiceImpl apiService = locator<APIService>();
  final AuthServiceImpl authenticationService = locator<AuthService>();

  List<TimeTable> streamData = List<TimeTable>();

  final String url =
      "https://raw.githubusercontent.com/shashiben/luffy/master/timetable.json";

  getTimeTable() async {
    bool exists = await hiveService.isExists(boxName: "TimeTable");

    final String studentYear = authenticationService.getStudentPresentYear();

    if (exists) {
      // Getting data from Hive
      List<TimeTable> temp = await hiveService.getBoxes<TimeTable>("TimeTable");

      for (var item in temp) {
        if (item.year == studentYear) {
          streamData.add(item);
        }
      }

      return true;
    } else {
      // Getting data from API and storing in hive for later usage

      try {
        var result = await apiService.fetchData(url: url);

        (result as List).forEach((item) {
          TimeTable timeTable = TimeTable(
              className: item["class_name"],
              startTime: item["start_time"],
              endTime: item["end_time"],
              day: item["day"],
              year: item["year"]);

          if (timeTable.year == studentYear) {
            streamData.add(timeTable);
          }
        });

        await hiveService.addBoxes<TimeTable>(streamData, "TimeTable");

        return true;
      } catch (e) {
        return e.toString();
      }
    }
  }

  List<TimeTable> getCurrentDayClasses() {
    var currentWeekDay = getCurrentWeekDay(DateTime.now().weekday);

    var result = streamData.where((element) => element.day == currentWeekDay);

    return result.toList();
  }

  List<TimeTable> getClassesOfDay(String currentWeekDay) {
    var result = streamData.where((element) => element.day == currentWeekDay);

    return result.toList();
  }
}
