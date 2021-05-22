import 'package:svuce_app/app/AppSetup.logger.dart';

List<int> generateCurrentWeekDays() {
  final log = getLogger("GenerateCurrentWeekDays");
  List<int> weekDays = [];

  DateTime dateTime = DateTime.now();
  int weekDay = dateTime.weekday;

  //?Add Left Dates
  for (int i = 0; i < weekDay - 1; i++) {
    weekDays
        .add(dateTime.subtract(Duration(days: dateTime.weekday - i - 1)).day);
  }

  //?Add Right Dates
  for (int i = weekDay - 1; i < 7; i++) {
    weekDays.add(dateTime.add(Duration(days: i - dateTime.weekday + 1)).day);
  }
  log.w("Generate Week Dates are:$weekDays");

  return weekDays;
}

String getStudentYear(String rollNo) {
  if (rollNo == null || rollNo.isEmpty) {
    return "";
  }

  rollNo = "20" + rollNo.substring(1, 3);

  String year = "";

  int currentYear = DateTime.now().year;

  int month = DateTime.now().month;

  int difference = currentYear - int.parse(rollNo);

  switch (difference) {
    case 1:
      if (month <= 6) {
        year = "first_year";
      } else {
        year = "second_year";
      }
      break;
    case 2:
      if (month <= 6) {
        year = "second_year";
      } else {
        year = "third_year";
      }
      break;
    case 3:
      if (month <= 6) {
        year = "third_year";
      } else {
        year = "final_year";
      }
      break;
    case 4:
      if (month <= 6) {
        year = "final_year";
      } else {
        year = "passed_out";
      }
      break;
  }

  return year;
}

String getCurrentWeekDay(int weekDay) {
  String returnWeekDay = "";

  switch (weekDay) {
    case 1:
      returnWeekDay = "MON";
      break;
    case 2:
      returnWeekDay = "TUE";
      break;
    case 3:
      returnWeekDay = "WED";
      break;
    case 4:
      returnWeekDay = "THU";
      break;
    case 5:
      returnWeekDay = "FRI";
      break;
    case 6:
      returnWeekDay = "SAT";
      break;
    default:
      returnWeekDay = "SUN";
  }

  return returnWeekDay;
}

final List<String> weekDays = ["MON", "TUE", "WED", "THU", "FRI", "SAT"];
