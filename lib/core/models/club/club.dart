class Club {
  Club({
    this.id,
    this.name,
    this.moto,
    this.clubBanner,
    this.clubLogo,
    this.description,
  });

  final String id;
  final String name;
  final String moto;
  final String clubBanner;
  final String clubLogo;
  final String description;

  Club copyWith({
    String id,
    String name,
    String moto,
    String clubBanner,
    String clubLogo,
    String description,
  }) =>
      Club(
        id: id ?? this.id,
        name: name ?? this.name,
        moto: moto ?? this.moto,
        clubBanner: clubBanner ?? this.clubBanner,
        clubLogo: clubLogo ?? this.clubLogo,
        description: description ?? this.description,
      );

  factory Club.fromMap(Map<String, dynamic> json, String id) => Club(
        id: id,
        name: json["name"] == null ? null : json["name"],
        moto: json["moto"] == null ? null : json["moto"],
        clubBanner: json["clubBanner"] == null ? null : json["clubBanner"],
        clubLogo: json["clubLogo"] == null ? null : json["clubLogo"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "moto": moto == null ? null : moto,
        "clubBanner": clubBanner == null ? null : clubBanner,
        "clubLogo": clubLogo == null ? null : clubLogo,
        "description": description == null ? null : description,
      };
}
