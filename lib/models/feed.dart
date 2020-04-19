import 'package:cloud_firestore/cloud_firestore.dart';

class Feed {
  final String fullName;
  final String uid;
  final String feedId;
  final String title;
  final String description;
  final String link;
  final String category;
  final String timeStamp;
  final String profileImg;

  Feed(
      {this.fullName,
      this.uid,
      this.feedId,
      this.title,
      this.description,
      this.link,
      this.timeStamp,
      this.category,
      this.profileImg});

  Feed.fromData(Map<String, dynamic> data, String feedId)
      : assert(data['uid'] != null),
        assert(data['link'] != null),
        assert(data['fullName'] != null),
        assert(data['profileImg'] != null),
        assert(data['title'] != null),
        assert(data['description'] != null),
        assert(data['timeStamp'] != null),
        assert(data['category'] != null),
        uid = data['uid'],
        feedId = feedId,
        link = data['link'],
        fullName = data['fullName'],
        profileImg = data['profileImg'],
        title = data['title'],
        description = data['description'],
        timeStamp = data['timeStamp'],
        category = data['category'];

  static Feed fromDocumentSnapShot(DocumentSnapshot snapshot) {
    if (!snapshot.exists || snapshot.data == null) return null;

    return Feed.fromData(snapshot.data, snapshot.documentID);
  }

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "feedId": feedId,
      "link": link,
      "title": title,
      "description": description,
      "category": category,
      "fullName": fullName,
      "profileImg": profileImg,
      "timeStamp": timeStamp,
    };
  }
}
