// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.userType,
    this.rollNo,
    this.profileImg,
    this.collegeName,
    this.phoneNumber,
  });

  final String id;
  final String fullName;
  final String email;
  final String userType;
  final int rollNo;
  final String profileImg;
  final String collegeName;
  final int phoneNumber;

  UserModel copyWith({
    String id,
    String fullName,
    String email,
    String userType,
    int rollNo,
    String profileImg,
    String collegeName,
    int phoneNumber,
  }) =>
      UserModel(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        userType: userType ?? this.userType,
        rollNo: rollNo ?? this.rollNo,
        profileImg: profileImg ?? this.profileImg,
        collegeName: collegeName ?? this.collegeName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : json["id"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        email: json["email"] == null ? null : json["email"],
        userType: json["userType"] == null ? null : json["userType"],
        rollNo: json["rollNo"] == null ? null : json["rollNo"],
        profileImg: json["profileImg"] == null ? null : json["profileImg"],
        collegeName: json["collegeName"] == null ? null : json["collegeName"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "fullName": fullName == null ? null : fullName,
        "email": email == null ? null : email,
        "userType": userType == null ? null : userType,
        "rollNo": rollNo == null ? null : rollNo,
        "profileImg": profileImg == null ? null : profileImg,
        "collegeName": collegeName == null ? null : collegeName,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
      };
}
