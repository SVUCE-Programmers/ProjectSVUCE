import 'package:cloud_firestore/cloud_firestore.dart';

//TODO: Update the fields and class name

class Upcoming {
  String eventName;
  String imageUrl;
  String organiser;
  String timeStamp;
  String place;
  Upcoming({
    this.eventName,
    this.imageUrl,
    this.organiser,
    this.place,
    this.timeStamp,
  });
  Upcoming.fromData(Map<String, dynamic> data)
      : assert(data['eventName'] != null),
        assert(data['imageUrl'] != null),
        assert(data['organiser'] != null),
        assert(data['timeStamp'] != null),
        assert(data['place'] != null),
        eventName = data['eventName'],
        imageUrl = data['imageUrl'],
        organiser = data['organiser'],
        timeStamp = data['timeStamp'],
        place = data['place'];

  static Upcoming fromDocumentSnapShot(DocumentSnapshot snapshot) {
    if (!snapshot.exists || snapshot.data == null) return null;

    return Upcoming.fromData(snapshot.data);
  }

  Map<String, String> toJson() {
    return {
      "eventName": eventName,
      "imageUrl": imageUrl,
      "organiser": organiser,
      "place": place,
      "timeStamp": timeStamp,
    };
  }
}
