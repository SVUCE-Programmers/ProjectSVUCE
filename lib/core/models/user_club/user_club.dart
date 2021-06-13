// To parse this JSON data, do
//
//     final userClub = userClubFromMap(jsonString);

import 'dart:convert';

UserClub userClubFromMap(String str) => UserClub.fromMap(json.decode(str));

String userClubToMap(UserClub data) => json.encode(data.toMap());

class UserClub {
  UserClub({
    this.id,
    this.name,
    this.clubLogo,
    this.description,
  });

  final String id;
  final String name;
  final String clubLogo;
  final String description;

  UserClub copyWith({
    String id,
    String name,
    String clubLogo,
    String description,
  }) =>
      UserClub(
        id: id ?? this.id,
        name: name ?? this.name,
        clubLogo: clubLogo ?? this.clubLogo,
        description: description ?? this.description,
      );

  factory UserClub.fromMap(Map<String, dynamic> json) => UserClub(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        clubLogo: json["clubLogo"] == null ? null : json["clubLogo"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "clubLogo": clubLogo == null ? null : clubLogo,
        "description": description == null ? null : description,
      };
}
