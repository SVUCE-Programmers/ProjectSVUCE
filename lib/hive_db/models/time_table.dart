import 'package:flutter/material.dart';

class TimeTable {
  final Map<String, String> monday;
  final Map<String, String> tuesday;
  final Map<String, String> wednesday;
  final Map<String, String> thursday;
  final Map<String, String> friday;
  final Map<String, String> saturday;
  final String id;

  TimeTable(
      {@required this.monday,
      @required this.tuesday,
      @required this.wednesday,
      @required this.thursday,
      @required this.friday,
      this.id,
      @required this.saturday});
  Map<String, dynamic> tojson() {
    return {
      "Monday": this.monday,
      "Tuesday": this.tuesday,
      "Wednesday": this.wednesday,
      "Thursday": this.thursday,
      "Friday": this.friday,
      "Saturday": this.saturday
    };
  }

  static TimeTable fromMap(Map<String, dynamic> json, String id) {
    return TimeTable(
        id: id,
        monday: json["Monday"] == null
            ? {}
            : Map<String, String>.from(json["Monday"]),
        tuesday: json["Tuesday"] == null
            ? {}
            : Map<String, String>.from(json["Tuesday"]),
        wednesday: json["Wednesday"] == null
            ? {}
            : Map<String, String>.from(json["Wednesday"]),
        thursday: json["Thursday"] == null
            ? {}
            : Map<String, String>.from(json["Thursday"]),
        friday: json["Friday"] == null
            ? {}
            : Map<String, String>.from(json["Friday"]),
        saturday: json["Saturday"] == null
            ? {}
            : Map<String, String>.from(json["Saturday"]));
  }
}
