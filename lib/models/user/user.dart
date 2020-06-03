import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User implements _$User {
  const User._();
  factory User(
      {String fullName,
      String id,
      String email,
      String rollNo,
      String bio,
      String contact,
      String collegeName,
      String profileImg,
      String userType,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static User fromDocument(DocumentSnapshot document) {
    if (document == null || document.data == null) return null;

    return User(
        id: document.documentID,
        email: document.data['email'],
        rollNo: document.data['rollNo'],
        fullName: document.data['fullName'],
        profileImg: document.data['profileImg'],
        collegeName: document.data['collegeName'],
        bio: document.data['bio'],
        contact: document.data['contact'],
        userType: document.data['userType'],
        documentReference: document.reference);
  }

  static User empty() {
    return User(
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
