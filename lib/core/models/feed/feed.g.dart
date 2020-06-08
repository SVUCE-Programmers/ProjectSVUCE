// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feed _$_$_FeedFromJson(Map<String, dynamic> json) {
  return _$_Feed(
    id: json['id'] as String,
    fullName: json['fullName'] as String,
    uid: json['uid'] as String,
    feedId: json['feedId'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    link: json['link'] as String,
    category: json['category'] as String,
    timeStamp: json['timeStamp'] as String,
    profileImg: json['profileImg'] as String,
  );
}

Map<String, dynamic> _$_$_FeedToJson(_$_Feed instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'uid': instance.uid,
      'feedId': instance.feedId,
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
      'category': instance.category,
      'timeStamp': instance.timeStamp,
      'profileImg': instance.profileImg,
    };
