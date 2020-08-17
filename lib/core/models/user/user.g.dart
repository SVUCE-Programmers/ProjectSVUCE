// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    fullName: json['fullName'] as String,
    id: json['id'] as String,
    email: json['email'] as String,
    rollNo: json['rollNo'] as String,
    bio: json['bio'] as String,
    contact: json['contact'] as String,
    collegeName: json['collegeName'] as String,
    profileImg: json['profileImg'] as String,
    userType: json['userType'] as String,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'id': instance.id,
      'email': instance.email,
      'rollNo': instance.rollNo,
      'bio': instance.bio,
      'contact': instance.contact,
      'collegeName': instance.collegeName,
      'profileImg': instance.profileImg,
      'userType': instance.userType,
    };
