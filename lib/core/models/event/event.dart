import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
abstract class Event implements _$Event {
  const Event._();
  factory Event(
      {String id,
      String name,
      String organiser,
      String place,
      String timeStamp,
      String imageUrl,
      String description,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  static Event fromDocument(DocumentSnapshot document) {
    if (document == null || document.data == null) return null;

    return Event(
        name: document.data["name"],
        organiser: document.data["organiser"],
        place: document.data["place"],
        timeStamp: document.data["timeStamp"],
        description: document.data["description"],
        imageUrl: document.data["imageUrl"],
        id: document.documentID,
        documentReference: document.reference);
  }

  static Event empty() {
    return Event(
        id: '',
        name: '',
        organiser: '',
        place: '',
        timeStamp: '',
        imageUrl: '',
        description: '',
        documentReference: null);
  }
}
