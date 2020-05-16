import 'package:cloud_firestore/cloud_firestore.dart';

class Announcement{
  final String timeStamp;
  final String desc;
  final String type;
  final String imgUrl;
  final DocumentReference reference;

  Announcement({this.timeStamp, this.desc, this.type,this.imgUrl,this.reference});

  Announcement.fromData(Map<String, dynamic> data ,{this.reference})
    :assert(data["timeStamp"]!=null),
     assert(data["type"]!=null),
     assert(data["desc"]!=null),
     assert(data["imgUrl"]!=null),
     imgUrl=data["imgUrl"],
     timeStamp=data["timeStamp"],
     desc=data["desc"],
     type=data["type"];

  static Announcement fromDocumentSnapShot(DocumentSnapshot snapshot) {
    if (!snapshot.exists || snapshot.data == null) return null;

    return Announcement.fromData(snapshot.data);
  }

  Map<String, String> toJson() {
    return {
      "type": type,
      "desc": desc,
      "timeStamp": timeStamp,
    };
  }

  Announcement.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromData(snapshot.data, reference: snapshot.reference);

}