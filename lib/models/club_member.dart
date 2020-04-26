import 'package:cloud_firestore/cloud_firestore.dart';

class ClubMember {
  String name;
  String uid;
  String profileImg;
  String notifyToken;
  String type;
  DocumentReference reference;

  ClubMember.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["name"] != null),
        assert(map["clubBanner"] != null),
        assert(map["clubLogo"] != null),
        assert(map["description"] != null),
        uid = reference.documentID,
        name = map["name"],
        profileImg = map["profileImg"],
        notifyToken = map["notifyToken"],
        type = map["type"];

  ClubMember.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
