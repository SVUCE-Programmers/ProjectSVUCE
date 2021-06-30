// To parse this JSON data, do
//
//     final staffModel = staffModelFromMap(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';
part 'staff_model.g.dart';

StaffModel staffModelFromMap(String str) =>
    StaffModel.fromMap(json.decode(str));

String staffModelToMap(StaffModel data) => json.encode(data.toMap());

@HiveType(typeId: 3)
class StaffModel {
  StaffModel({
    this.designation,
    this.name,
    this.phone,
    this.email,
    this.details,
    this.imgUrl,
    this.branch,
  });
  @HiveField(0)
  final List<String> designation;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String details;
  @HiveField(5)
  final String imgUrl;
  @HiveField(6)
  final String branch;

  StaffModel copyWith({
    List<String> designation,
    String name,
    String phone,
    String email,
    String details,
    String imgUrl,
    String branch,
  }) =>
      StaffModel(
        designation: designation ?? this.designation,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        details: details ?? this.details,
        imgUrl: imgUrl ?? this.imgUrl,
        branch: branch ?? this.branch,
      );

  factory StaffModel.fromMap(Map<String, dynamic> json) => StaffModel(
        designation: json["designation"] == null
            ? null
            : List<String>.from(json["designation"]),
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        details: json["details"] == null ? null : json["details"],
        imgUrl: json["imgurl"] == null ? "" : json["imgurl"],
        branch: json["branch"] == null ? null : json["branch"],
      );

  Map<String, dynamic> toMap() => {
        "designation": designation == null ? null : designation,
        "name": name == null ? null : name,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "details": details == null ? null : details,
        "imgUrl": imgUrl == null ? null : imgUrl,
        "branch": branch == null ? null : branch,
      };
}
