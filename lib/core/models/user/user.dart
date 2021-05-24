import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserModel implements _$User {
  const UserModel._();
  factory UserModel(
      {@required String fullName,
      @required String id,
      @required String email,
      @required String rollNo,
      @required String bio,
      @required String contact,
      @required String collegeName,
      @required String profileImg,
      @required String userType,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _User;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

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
        bio: docData['bio'],
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
        bio: '',
        contact: '',
        documentReference: null);
  }
}
