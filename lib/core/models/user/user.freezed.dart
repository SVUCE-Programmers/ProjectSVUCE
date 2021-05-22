// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserModel _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {String fullName,
      String id,
      String email,
      String rollNo,
      String bio,
      String contact,
      String collegeName,
      String profileImg,
      String userType,
      @JsonKey(ignore: true) DocumentReference documentReference}) {
    return _User(
      fullName: fullName,
      id: id,
      email: email,
      rollNo: rollNo,
      bio: bio,
      contact: contact,
      collegeName: collegeName,
      profileImg: profileImg,
      userType: userType,
      documentReference: documentReference,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  String get fullName;
  String get id;
  String get email;
  String get rollNo;
  String get bio;
  String get contact;
  String get collegeName;
  String get profileImg;
  String get userType;
  @JsonKey(ignore: true)
  DocumentReference get documentReference;

  Map<String, dynamic> toJson();
  $UserCopyWith<UserModel> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String fullName,
      String id,
      String email,
      String rollNo,
      String bio,
      String contact,
      String collegeName,
      String profileImg,
      String userType,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object fullName = freezed,
    Object id = freezed,
    Object email = freezed,
    Object rollNo = freezed,
    Object bio = freezed,
    Object contact = freezed,
    Object collegeName = freezed,
    Object profileImg = freezed,
    Object userType = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      id: id == freezed ? _value.id : id as String,
      email: email == freezed ? _value.email : email as String,
      rollNo: rollNo == freezed ? _value.rollNo : rollNo as String,
      bio: bio == freezed ? _value.bio : bio as String,
      contact: contact == freezed ? _value.contact : contact as String,
      collegeName:
          collegeName == freezed ? _value.collegeName : collegeName as String,
      profileImg:
          profileImg == freezed ? _value.profileImg : profileImg as String,
      userType: userType == freezed ? _value.userType : userType as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String fullName,
      String id,
      String email,
      String rollNo,
      String bio,
      String contact,
      String collegeName,
      String profileImg,
      String userType,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object fullName = freezed,
    Object id = freezed,
    Object email = freezed,
    Object rollNo = freezed,
    Object bio = freezed,
    Object contact = freezed,
    Object collegeName = freezed,
    Object profileImg = freezed,
    Object userType = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_User(
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      id: id == freezed ? _value.id : id as String,
      email: email == freezed ? _value.email : email as String,
      rollNo: rollNo == freezed ? _value.rollNo : rollNo as String,
      bio: bio == freezed ? _value.bio : bio as String,
      contact: contact == freezed ? _value.contact : contact as String,
      collegeName:
          collegeName == freezed ? _value.collegeName : collegeName as String,
      profileImg:
          profileImg == freezed ? _value.profileImg : profileImg as String,
      userType: userType == freezed ? _value.userType : userType as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

@JsonSerializable()
class _$_User extends _User with DiagnosticableTreeMixin {
  _$_User(
      {this.fullName,
      this.id,
      this.email,
      this.rollNo,
      this.bio,
      this.contact,
      this.collegeName,
      this.profileImg,
      this.userType,
      @JsonKey(ignore: true) this.documentReference})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String fullName;
  @override
  final String id;
  @override
  final String email;
  @override
  final String rollNo;
  @override
  final String bio;
  @override
  final String contact;
  @override
  final String collegeName;
  @override
  final String profileImg;
  @override
  final String userType;
  @override
  @JsonKey(ignore: true)
  final DocumentReference documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(fullName: $fullName, id: $id, email: $email, rollNo: $rollNo, bio: $bio, contact: $contact, collegeName: $collegeName, profileImg: $profileImg, userType: $userType, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('rollNo', rollNo))
      ..add(DiagnosticsProperty('bio', bio))
      ..add(DiagnosticsProperty('contact', contact))
      ..add(DiagnosticsProperty('collegeName', collegeName))
      ..add(DiagnosticsProperty('profileImg', profileImg))
      ..add(DiagnosticsProperty('userType', userType))
      ..add(DiagnosticsProperty('documentReference', documentReference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.rollNo, rollNo) ||
                const DeepCollectionEquality().equals(other.rollNo, rollNo)) &&
            (identical(other.bio, bio) ||
                const DeepCollectionEquality().equals(other.bio, bio)) &&
            (identical(other.contact, contact) ||
                const DeepCollectionEquality()
                    .equals(other.contact, contact)) &&
            (identical(other.collegeName, collegeName) ||
                const DeepCollectionEquality()
                    .equals(other.collegeName, collegeName)) &&
            (identical(other.profileImg, profileImg) ||
                const DeepCollectionEquality()
                    .equals(other.profileImg, profileImg)) &&
            (identical(other.userType, userType) ||
                const DeepCollectionEquality()
                    .equals(other.userType, userType)) &&
            (identical(other.documentReference, documentReference) ||
                const DeepCollectionEquality()
                    .equals(other.documentReference, documentReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(rollNo) ^
      const DeepCollectionEquality().hash(bio) ^
      const DeepCollectionEquality().hash(contact) ^
      const DeepCollectionEquality().hash(collegeName) ^
      const DeepCollectionEquality().hash(profileImg) ^
      const DeepCollectionEquality().hash(userType) ^
      const DeepCollectionEquality().hash(documentReference);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User extends UserModel {
  _User._() : super._();
  factory _User(
      {String fullName,
      String id,
      String email,
      String rollNo,
      String bio,
      String contact,
      String collegeName,
      String profileImg,
      String userType,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get fullName;
  @override
  String get id;
  @override
  String get email;
  @override
  String get rollNo;
  @override
  String get bio;
  @override
  String get contact;
  @override
  String get collegeName;
  @override
  String get profileImg;
  @override
  String get userType;
  @override
  @JsonKey(ignore: true)
  DocumentReference get documentReference;
  @override
  _$UserCopyWith<_User> get copyWith;
}
