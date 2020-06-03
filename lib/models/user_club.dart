import 'package:cloud_firestore/cloud_firestore.dart';

class UserClub {
  final String clubId;
  final String clubLogo;
  final String name;
  DocumentReference reference;

  UserClub.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["clubLogo"] != null),
        assert(map["name"] != null),
        name = map["name"],
        clubId = reference.documentID,
        clubLogo = map["clubLogo"];

  UserClub({this.clubId, this.clubLogo, this.name});

  UserClub.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {
      "clubId": clubId,
      "clubLogo": clubLogo,
      "name": name,
    };
  }
}
