import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'club.freezed.dart';
part 'club.g.dart';

@freezed
abstract class Club implements _$Club {
  const Club._();
  factory Club(
      {String id,
      String name,
      String moto,
      String clubBanner,
      String clubLogo,
      String description,
      String followers,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _Club;

  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);

  static Club fromDocument(DocumentSnapshot document) {
    if (document == null || document.data() == null) return null;
    var docData = Map<String, dynamic>.from(document.data());

    return Club(
        name: docData["name"],
        moto: docData["moto"],
        clubBanner: docData["clubBanner"],
        clubLogo: docData["clubLogo"],
        description: docData["description"],
        followers: docData["followers"],
        id: document.id,
        documentReference: document.reference);
  }

  static Club empty() {
    return Club(
        id: '',
        name: '',
        moto: '',
        clubBanner: '',
        clubLogo: '',
        description: '',
        followers: '',
        documentReference: null);
  }
}
