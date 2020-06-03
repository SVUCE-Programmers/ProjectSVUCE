// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_club.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserClub _$UserClubFromJson(Map<String, dynamic> json) {
  return _UserClub.fromJson(json);
}

class _$UserClubTearOff {
  const _$UserClubTearOff();

  _UserClub call(
      {String id,
      String clubLogo,
      String name,
      @JsonKey(ignore: true) DocumentReference documentReference}) {
    return _UserClub(
      id: id,
      clubLogo: clubLogo,
      name: name,
      documentReference: documentReference,
    );
  }
}

// ignore: unused_element
const $UserClub = _$UserClubTearOff();

mixin _$UserClub {
  String get id;
  String get clubLogo;
  String get name;
  @JsonKey(ignore: true)
  DocumentReference get documentReference;

  Map<String, dynamic> toJson();
  $UserClubCopyWith<UserClub> get copyWith;
}

abstract class $UserClubCopyWith<$Res> {
  factory $UserClubCopyWith(UserClub value, $Res Function(UserClub) then) =
      _$UserClubCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String clubLogo,
      String name,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class _$UserClubCopyWithImpl<$Res> implements $UserClubCopyWith<$Res> {
  _$UserClubCopyWithImpl(this._value, this._then);

  final UserClub _value;
  // ignore: unused_field
  final $Res Function(UserClub) _then;

  @override
  $Res call({
    Object id = freezed,
    Object clubLogo = freezed,
    Object name = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      clubLogo: clubLogo == freezed ? _value.clubLogo : clubLogo as String,
      name: name == freezed ? _value.name : name as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

abstract class _$UserClubCopyWith<$Res> implements $UserClubCopyWith<$Res> {
  factory _$UserClubCopyWith(_UserClub value, $Res Function(_UserClub) then) =
      __$UserClubCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String clubLogo,
      String name,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class __$UserClubCopyWithImpl<$Res> extends _$UserClubCopyWithImpl<$Res>
    implements _$UserClubCopyWith<$Res> {
  __$UserClubCopyWithImpl(_UserClub _value, $Res Function(_UserClub) _then)
      : super(_value, (v) => _then(v as _UserClub));

  @override
  _UserClub get _value => super._value as _UserClub;

  @override
  $Res call({
    Object id = freezed,
    Object clubLogo = freezed,
    Object name = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_UserClub(
      id: id == freezed ? _value.id : id as String,
      clubLogo: clubLogo == freezed ? _value.clubLogo : clubLogo as String,
      name: name == freezed ? _value.name : name as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

@JsonSerializable()
class _$_UserClub extends _UserClub with DiagnosticableTreeMixin {
  _$_UserClub(
      {this.id,
      this.clubLogo,
      this.name,
      @JsonKey(ignore: true) this.documentReference})
      : super._();

  factory _$_UserClub.fromJson(Map<String, dynamic> json) =>
      _$_$_UserClubFromJson(json);

  @override
  final String id;
  @override
  final String clubLogo;
  @override
  final String name;
  @override
  @JsonKey(ignore: true)
  final DocumentReference documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserClub(id: $id, clubLogo: $clubLogo, name: $name, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserClub'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('clubLogo', clubLogo))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('documentReference', documentReference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserClub &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.clubLogo, clubLogo) ||
                const DeepCollectionEquality()
                    .equals(other.clubLogo, clubLogo)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.documentReference, documentReference) ||
                const DeepCollectionEquality()
                    .equals(other.documentReference, documentReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(clubLogo) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(documentReference);

  @override
  _$UserClubCopyWith<_UserClub> get copyWith =>
      __$UserClubCopyWithImpl<_UserClub>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserClubToJson(this);
  }
}

abstract class _UserClub extends UserClub {
  _UserClub._() : super._();
  factory _UserClub(
          {String id,
          String clubLogo,
          String name,
          @JsonKey(ignore: true) DocumentReference documentReference}) =
      _$_UserClub;

  factory _UserClub.fromJson(Map<String, dynamic> json) = _$_UserClub.fromJson;

  @override
  String get id;
  @override
  String get clubLogo;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  DocumentReference get documentReference;
  @override
  _$UserClubCopyWith<_UserClub> get copyWith;
}
