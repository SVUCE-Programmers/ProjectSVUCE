import 'package:hive/hive.dart';
part 'time_table.g.dart';

@HiveType(typeId: 3)
class TimeTable {
  @HiveField(0)
  final String className;
  @HiveField(1)
  final String startTime;
  @HiveField(2)
  final String endTime;
  @HiveField(3)
  final String day;
  @HiveField(4)
  final String year;

  TimeTable(
      {this.className, this.startTime, this.endTime, this.day, this.year});
}
