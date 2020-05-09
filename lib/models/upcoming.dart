import 'package:cloud_firestore/cloud_firestore.dart';


class Event {
  String eventName;
  String imageUrl;
  String organiser;
  String timeStamp;
  String place;
  Event({
    this.eventName,
    this.imageUrl,
    this.organiser,
    this.place,
    this.timeStamp,
  });
  Event.fromData(Map<String, dynamic> data)
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

  static Event fromDocumentSnapShot(DocumentSnapshot snapshot) {
    if (!snapshot.exists || snapshot.data == null) return null;

    return Event.fromData(snapshot.data);
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
