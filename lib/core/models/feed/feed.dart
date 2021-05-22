import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@freezed
abstract class Feed implements _$Feed {
  const Feed._();
  factory Feed(
      {String id,
      String fullName,
      String uid,
      String feedId,
      String title,
      String description,
      String link,
      String category,
      String timeStamp,
      String profileImg,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  static Feed fromDocument(DocumentSnapshot document) {
    if (document == null || document.data() == null) return null;
    var docData = Map<String, dynamic>.from(document.data());

    return Feed(
        id: document.id,
        uid: docData['uid'],
        feedId: docData['feedId'],
        link: docData['link'],
        fullName: docData['fullName'],
        profileImg: docData['profileImg'],
        title: docData['title'],
        description: docData['description'],
        timeStamp: docData['timeStamp'],
        category: docData['category'],
        documentReference: document.reference);
  }

  static Feed empty() {
    return Feed(
        uid: '',
        id: '',
        feedId: '',
        link: '',
        title: '',
        description: '',
        category: '',
        fullName: '',
        profileImg: '',
        timeStamp: '',
        documentReference: null);
  }
}
