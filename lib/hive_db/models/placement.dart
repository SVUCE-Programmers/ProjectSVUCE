import 'package:hive/hive.dart';
part 'placement.g.dart';

@HiveType(typeId: 1)
class Placement {
  @HiveField(0)
  final String year;
  @HiveField(1)
  final int no;

  Placement({this.year, this.no});
}
