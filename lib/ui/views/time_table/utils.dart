List<int> generateCurrentWeekDays() {
  List<int> weekDays = [];

  int currentWeekDay = DateTime.now().weekday;

  int alpha = 0;

  int currentDay = DateTime.now().day;

  switch (currentWeekDay) {
    case 1:
      alpha = currentDay;
      break;
    case 2:
      alpha = currentDay - 1;
      break;
    case 3:
      alpha = currentDay - 2;
      break;
    case 4:
      alpha = currentDay - 3;
      break;
    case 5:
      alpha = currentDay - 4;
      break;
    case 6:
      alpha = currentDay - 5;
      break;
    case 7:
      alpha = currentDay - 6;
      break;
  }

  for (var i = 0; i < 7; i++) {
    weekDays.add(alpha + i);
  }

  return weekDays;
}

getStudentYear(String rollNo) {
  if (rollNo == null || rollNo.isEmpty) {
    return "";
  }

  rollNo = "20" + rollNo.substring(1, 3);

  String year = "";

  int currentYear = DateTime.now().year;

  int difference = currentYear - int.parse(rollNo);

  switch (difference) {
    case 1:
      year = "first_year";
      break;
    case 2:
      year = "second_year";
      break;
    case 3:
      year = "third_year";
      break;
    case 4:
      year = "final_year";
      break;
  }

  return year;
}

getCurrentWeekDay(int weekDay) {
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
