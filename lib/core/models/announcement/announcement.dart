import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'announcement.freezed.dart';
part 'announcement.g.dart';

@freezed
abstract class Announcement implements _$Announcement {
  const Announcement._();
  factory Announcement(
          {String id,
          String timeStamp,
          String desc,
          String type,
          String imgUrl,
          @JsonKey(ignore: true) DocumentReference documentReference}) =
      _Announcement;

  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);

  static Announcement fromDocument(DocumentSnapshot document) {
    if (document == null || document.data == null) return null;

    return Announcement(
        imgUrl: document.data["imgUrl"],
        timeStamp: document.data["timeStamp"],
        desc: document.data["desc"],
        type: document.data["type"],
        id: document.documentID,
        documentReference: document.reference);
  }

  static Announcement empty() {
    return Announcement(
        type: '',
        desc: '',
        timeStamp: '',
        imgUrl: '',
        id: '',
        documentReference: null);
  }
}
