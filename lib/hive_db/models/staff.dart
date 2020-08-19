import 'package:hive/hive.dart';

part 'staff.g.dart';

@HiveType(typeId: 2)
class Staff {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String fullName;
  @HiveField(2)
  final String avatar;

  Staff({this.email, this.fullName, this.avatar});
}
