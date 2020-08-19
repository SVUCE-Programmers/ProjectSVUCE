import 'package:hive/hive.dart';
part 'attendance.g.dart';

@HiveType(typeId: 0)
class Attendance {
  @HiveField(0)
  final String subject;
  @HiveField(1)
  final int present;
  @HiveField(2)
  final int absent;
  @HiveField(3)
  final int total;
  @HiveField(4)
  final String lastUpdated;

  Attendance(
      {this.subject, this.present, this.absent, this.total, this.lastUpdated});
}
