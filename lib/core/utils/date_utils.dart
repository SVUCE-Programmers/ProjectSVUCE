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

class DateTimeUtils {
  List<String> weekDayList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List<String> monthsList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> shortMonthsList = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  String getWeekDay() {
    int index = DateTime.now().weekday;
    return weekDayList[index - 1];
  }

  String getMonth(int timeStamp, bool isShort) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
    int month = date.month;
    return isShort ? shortMonthsList[month] : monthsList[month];
  }

  String getDate(int timeStamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return date.day < 10 ? "0${date.day}" : date.day.toString();
  }

  getTime(int timeStamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
    String time = date.hour.toString() + ":" + date.minute.toString();
    return time;
  }

  getWholeDate(int timeStamp, {bool isIncludeTime = false}) {
    try {
      var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
      String tim = monthsList[date.month - 1] +
          " " +
          date.day.toString() +
          "," +
          date.year.toString() +
          (!isIncludeTime ? "" : (" " + getTime(timeStamp)));
      return tim;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  String timeAgoSinceDate(int timeStamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
    final date2 = DateTime.now();
    final difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return 'Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} months ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return 'Last month';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
