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
    if (document == null || document.data() == null) return null;
    var docData = Map<String, dynamic>.from(document.data());

    return UserClub(
        id: document.id,
        documentReference: document.reference,
        clubLogo: docData['clubLogo'],
        name: docData['name']);
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
