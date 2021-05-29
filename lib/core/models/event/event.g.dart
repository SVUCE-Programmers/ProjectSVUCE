// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$_$_EventFromJson(Map<String, dynamic> json) {
  return _$_Event(
    id: json['id'] as String,
    name: json['name'] as String,
    organiser: json['organiser'] as String,
    place: json['place'] as String,
    timeStamp: json['timeStamp'] == null
        ? null
        : DateTime.parse(json['timeStamp'] as String),
    imageUrl: json['imageUrl'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'organiser': instance.organiser,
      'place': instance.place,
      'timeStamp': instance.timeStamp?.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'description': instance.description,
    };
