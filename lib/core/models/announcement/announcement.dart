// To parse this JSON data, do
//
//     final announcement = announcementFromMap(jsonString);

import 'dart:convert';


Announcement announcementFromMap(String str) =>
    Announcement.fromMap(json.decode(str));

String announcementToMap(Announcement data) => json.encode(data.toMap());

class Announcement {
  Announcement({
    this.type,
    this.desc,
    this.timeStamp,
    this.imgUrl,
    this.id,
  
  });

  final String type;
  final String desc;
  final String timeStamp;
  final String imgUrl;
  final String id;

  Announcement copyWith({
    String type,
    String desc,
    String timeStamp,
    String imgUrl,
    String id,
    
  }) =>
      Announcement(
        type: type ?? this.type,
        desc: desc ?? this.desc,
        timeStamp: timeStamp ?? this.timeStamp,
        imgUrl: imgUrl ?? this.imgUrl,
        id: id ?? this.id,
      );

  factory Announcement.fromMap(Map<String, dynamic> json) => Announcement(
        type: json["type"] == null ? null : json["type"],
        desc: json["desc"] == null ? null : json["desc"],
        timeStamp: json["timeStamp"] == null ? null : json["timeStamp"],
        imgUrl: json["imgUrl"] == null ? null : json["imgUrl"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : type,
        "desc": desc == null ? null : desc,
        "timeStamp": timeStamp == null ? null : timeStamp,
        "imgUrl": imgUrl == null ? null : imgUrl,
        "id": id == null ? null : id,
      };
}
