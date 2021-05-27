// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

// ignore: unused_element
  _UserModel call(
      {@required String fullName,
      @required String id,
      @required String email,
      @required String rollNo,
      @required String bio,
      @required String contact,
      @required String collegeName,
      @required String profileImg,
      @required String userType,
      @JsonKey(ignore: true) DocumentReference<Object> documentReference}) {
    return _UserModel(
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

// ignore: unused_element
  UserModel fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
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
  DocumentReference<Object> get documentReference;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
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
      @JsonKey(ignore: true) DocumentReference<Object> documentReference});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

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
          : documentReference as DocumentReference<Object>,
    ));
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
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
      @JsonKey(ignore: true) DocumentReference<Object> documentReference});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

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
    return _then(_UserModel(
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
          : documentReference as DocumentReference<Object>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserModel extends _UserModel with DiagnosticableTreeMixin {
  _$_UserModel(
      {@required this.fullName,
      @required this.id,
      @required this.email,
      @required this.rollNo,
      @required this.bio,
      @required this.contact,
      @required this.collegeName,
      @required this.profileImg,
      @required this.userType,
      @JsonKey(ignore: true) this.documentReference})
      : assert(fullName != null),
        assert(id != null),
        assert(email != null),
        assert(rollNo != null),
        assert(bio != null),
        assert(contact != null),
        assert(collegeName != null),
        assert(profileImg != null),
        assert(userType != null),
        super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserModelFromJson(json);

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
  final DocumentReference<Object> documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(fullName: $fullName, id: $id, email: $email, rollNo: $rollNo, bio: $bio, contact: $contact, collegeName: $collegeName, profileImg: $profileImg, userType: $userType, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
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
        (other is _UserModel &&
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

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserModelToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  _UserModel._() : super._();
  factory _UserModel(
          {@required String fullName,
          @required String id,
          @required String email,
          @required String rollNo,
          @required String bio,
          @required String contact,
          @required String collegeName,
          @required String profileImg,
          @required String userType,
          @JsonKey(ignore: true) DocumentReference<Object> documentReference}) =
      _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

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
  DocumentReference<Object> get documentReference;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith;
}
