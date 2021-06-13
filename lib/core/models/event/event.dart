// To parse this JSON data, do
//
//     final event = eventFromMap(jsonString);

import 'dart:convert';

Event eventFromMap(String str) => Event.fromMap(json.decode(str));

String eventToMap(Event data) => json.encode(data.toMap());

class Event {
  Event({
    this.endTime,
    this.startTime,
    this.name,
    this.organiser,
    this.place,
    this.timeStamp,
    this.imageUrl,
    this.id,
    this.description,
  });

  final int endTime;
  final int startTime;
  final String name;
  final String organiser;
  final String id;
  final String place;
  final int timeStamp;
  final String imageUrl;
  final String description;

  Event copyWith({
    int endTime,
    int startTime,
    String name,
    String organiser,
    String place,
    int timeStamp,
    String imageUrl,
    String description,
  }) =>
      Event(
        endTime: endTime ?? this.endTime,
        startTime: startTime ?? this.startTime,
        name: name ?? this.name,
        organiser: organiser ?? this.organiser,
        place: place ?? this.place,
        timeStamp: timeStamp ?? this.timeStamp,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
      );

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        id: json["id"] == null ? null : json["id"],
        endTime: json["endTime"] == null ? null : json["endTime"],
        startTime: json["startTime"] == null ? null : json["startTime"],
        name: json["name"] == null ? null : json["name"],
        organiser: json["organiser"] == null ? null : json["organiser"],
        place: json["place"] == null ? null : json["place"],
        timeStamp: json["timeStamp"] == null ? null : json["timeStamp"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "endTime": endTime == null ? null : endTime,
        "startTime": startTime == null ? null : startTime,
        "name": name == null ? null : name,
        "organiser": organiser == null ? null : organiser,
        "place": place == null ? null : place,
        "timeStamp": timeStamp == null ? null : timeStamp,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "description": description == null ? null : description,
      };
}
