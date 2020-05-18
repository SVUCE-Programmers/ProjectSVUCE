class TimeTable {
  final String className;
  final String startTime;
  final String endTime;
  final String day;
  final String year;

  TimeTable(
      {this.className, this.startTime, this.endTime, this.day, this.year});

  TimeTable.fromData(Map<String, dynamic> data)
      : className = data["class_name"],
        startTime = data["start_time"],
        endTime = data["end_time"],
        day = data["day"],
        year = data["year"];
}
