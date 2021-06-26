// To parse this JSON data, do
//
//     final locationModel = locationModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LocationModel locationModelFromMap(String str) =>
    LocationModel.fromMap(json.decode(str));

String locationModelToMap(LocationModel data) => json.encode(data.toMap());

class LocationModel {
  LocationModel({
    @required this.name,
    @required this.latitude,
    @required this.longitude,
    @required this.description,
    @required this.imgUrl,
  });

  final String name;
  final double latitude;
  final double longitude;
  final String description;
  final String imgUrl;

  LocationModel copyWith({
    String name,
    double latitude,
    double longitude,
    String description,
    String imgUrl,
  }) =>
      LocationModel(
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        description: description ?? this.description,
        imgUrl: imgUrl ?? this.imgUrl,
      );

  factory LocationModel.fromMap(Map<String, dynamic> json) => LocationModel(
        name: json["name"] == null ? null : json["name"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        imgUrl: json["imgUrl"] == null ? null : json["imgUrl"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "description": description == null ? null : description,
        "imgUrl": imgUrl == null ? null : imgUrl,
      };
}
