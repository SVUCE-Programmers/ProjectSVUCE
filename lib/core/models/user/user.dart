import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserModel implements _$UserModel {
  const UserModel._();
  factory UserModel(
          {@required String fullName,
          @Default(null) String id,
          @required String email,
          @required String rollNo,
          @required String contact,
          @required String collegeName,
          String profileImg,
          @required String userType,
          @JsonKey(ignore: true) DocumentReference documentReference}) =
      _$_UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static UserModel fromDocument(DocumentSnapshot document) {
    if (document == null || document.data() == null) return null;
    var docData = Map<String, dynamic>.from(document.data());

    return UserModel(
        id: docData['id'],
        email: docData['email'],
        rollNo: docData['rollNo'],
        fullName: docData['fullName'],
        profileImg: docData['profileImg'],
        collegeName: docData['collegeName'],
        contact: docData['contact'],
        userType: docData['userType'],
        documentReference: document.reference);
  }

  static UserModel empty() {
    return UserModel(
        id: '',
        fullName: '',
        email: '',
        userType: '',
        rollNo: '',
        profileImg: '',
        collegeName: '',
        contact: '',
        documentReference: null);
  }
}
