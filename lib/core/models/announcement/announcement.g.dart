// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Announcement _$_$_AnnouncementFromJson(Map<String, dynamic> json) {
  return _$_Announcement(
    id: json['id'] as String,
    timeStamp: json['timeStamp'] as String,
    desc: json['desc'] as String,
    type: json['type'] as String,
    imgUrl: json['imgUrl'] as String,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_AnnouncementToJson(_$_Announcement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeStamp': instance.timeStamp,
      'desc': instance.desc,
      'type': instance.type,
      'imgUrl': instance.imgUrl,
    };
