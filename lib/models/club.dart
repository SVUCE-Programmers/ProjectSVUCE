import 'package:cloud_firestore/cloud_firestore.dart';

class Club {
  final String id;
  final String name;
  final String clubBanner;
  final String clubLogo;
  final String description;
  final String followers;
  final DocumentReference reference;

  Club.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["name"] != null),
        assert(map["clubBanner"] != null),
        assert(map["clubLogo"] != null),
        assert(map["description"] != null),
        id = reference.documentID,
        name = map["name"],
        clubBanner = map["clubBanner"],
        clubLogo = map["clubLogo"],
        description = map["description"],
        followers = map["followers"];

  Club.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
