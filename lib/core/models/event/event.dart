import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
abstract class Event implements _$Event {
  const Event._();
  factory Event(
      {@JsonKey(ignore: true) String id,
      @required String name,
      @required String organiser,
      @required String place,
      @required int timeStamp,
      @required int startTime,
      @required int endTime,
      @required String imageUrl,
      @required String description,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  static Event fromDocument(DocumentSnapshot document) {
    if (document == null || document.data() == null) return null;
    var docData = Map<String, dynamic>.from(document.data());
    return Event(
        name: docData["name"],
        organiser: docData["organiser"],
        place: docData["place"],
        timeStamp: docData["timeStamp"],
        startTime: docData["startTime"],
        endTime: docData["endTime"],
        description: docData["description"],
        imageUrl: docData["imageUrl"],
        id: document.id,
        documentReference: document.reference);
  }

  static Event empty() {
    return Event(
        endTime: DateTime.now().millisecondsSinceEpoch,
        startTime: DateTime.now().millisecondsSinceEpoch,
        name: '',
        organiser: '',
        place: '',
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        imageUrl: '',
        description: '',
        documentReference: null);
  }
}
