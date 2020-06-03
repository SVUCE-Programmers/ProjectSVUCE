import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_club.freezed.dart';
part 'user_club.g.dart';

@freezed
abstract class UserClub implements _$UserClub {
  const UserClub._();
  factory UserClub(
      {String id,
      String clubLogo,
      String name,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _UserClub;

  factory UserClub.fromJson(Map<String, dynamic> json) =>
      _$UserClubFromJson(json);

  static UserClub fromDocument(DocumentSnapshot document) {
    if (document == null || document.data == null) return null;

    return UserClub(
        id: document.documentID,
        documentReference: document.reference,
        clubLogo: document.data['clubLogo'],
        name: document.data['name']);
  }

  static UserClub empty() {
    return UserClub(
      id: '',
      clubLogo: '',
      name: '',
      documentReference: null,
    );
  }
}
