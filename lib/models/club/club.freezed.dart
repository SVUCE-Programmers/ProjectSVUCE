// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'club.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Club _$ClubFromJson(Map<String, dynamic> json) {
  return _Club.fromJson(json);
}

class _$ClubTearOff {
  const _$ClubTearOff();

  _Club call(
      {String id,
      String name,
      String moto,
      String clubBanner,
      String clubLogo,
      String description,
      String followers,
      @JsonKey(ignore: true) DocumentReference documentReference}) {
    return _Club(
      id: id,
      name: name,
      moto: moto,
      clubBanner: clubBanner,
      clubLogo: clubLogo,
      description: description,
      followers: followers,
      documentReference: documentReference,
    );
  }
}

// ignore: unused_element
const $Club = _$ClubTearOff();

mixin _$Club {
  String get id;
  String get name;
  String get moto;
  String get clubBanner;
  String get clubLogo;
  String get description;
  String get followers;
  @JsonKey(ignore: true)
  DocumentReference get documentReference;

  Map<String, dynamic> toJson();
  $ClubCopyWith<Club> get copyWith;
}

abstract class $ClubCopyWith<$Res> {
  factory $ClubCopyWith(Club value, $Res Function(Club) then) =
      _$ClubCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String moto,
      String clubBanner,
      String clubLogo,
      String description,
      String followers,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class _$ClubCopyWithImpl<$Res> implements $ClubCopyWith<$Res> {
  _$ClubCopyWithImpl(this._value, this._then);

  final Club _value;
  // ignore: unused_field
  final $Res Function(Club) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object moto = freezed,
    Object clubBanner = freezed,
    Object clubLogo = freezed,
    Object description = freezed,
    Object followers = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      moto: moto == freezed ? _value.moto : moto as String,
      clubBanner:
          clubBanner == freezed ? _value.clubBanner : clubBanner as String,
      clubLogo: clubLogo == freezed ? _value.clubLogo : clubLogo as String,
      description:
          description == freezed ? _value.description : description as String,
      followers: followers == freezed ? _value.followers : followers as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

abstract class _$ClubCopyWith<$Res> implements $ClubCopyWith<$Res> {
  factory _$ClubCopyWith(_Club value, $Res Function(_Club) then) =
      __$ClubCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String moto,
      String clubBanner,
      String clubLogo,
      String description,
      String followers,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class __$ClubCopyWithImpl<$Res> extends _$ClubCopyWithImpl<$Res>
    implements _$ClubCopyWith<$Res> {
  __$ClubCopyWithImpl(_Club _value, $Res Function(_Club) _then)
      : super(_value, (v) => _then(v as _Club));

  @override
  _Club get _value => super._value as _Club;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object moto = freezed,
    Object clubBanner = freezed,
    Object clubLogo = freezed,
    Object description = freezed,
    Object followers = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_Club(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      moto: moto == freezed ? _value.moto : moto as String,
      clubBanner:
          clubBanner == freezed ? _value.clubBanner : clubBanner as String,
      clubLogo: clubLogo == freezed ? _value.clubLogo : clubLogo as String,
      description:
          description == freezed ? _value.description : description as String,
      followers: followers == freezed ? _value.followers : followers as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

@JsonSerializable()
class _$_Club extends _Club with DiagnosticableTreeMixin {
  _$_Club(
      {this.id,
      this.name,
      this.moto,
      this.clubBanner,
      this.clubLogo,
      this.description,
      this.followers,
      @JsonKey(ignore: true) this.documentReference})
      : super._();

  factory _$_Club.fromJson(Map<String, dynamic> json) =>
      _$_$_ClubFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String moto;
  @override
  final String clubBanner;
  @override
  final String clubLogo;
  @override
  final String description;
  @override
  final String followers;
  @override
  @JsonKey(ignore: true)
  final DocumentReference documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Club(id: $id, name: $name, moto: $moto, clubBanner: $clubBanner, clubLogo: $clubLogo, description: $description, followers: $followers, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Club'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('moto', moto))
      ..add(DiagnosticsProperty('clubBanner', clubBanner))
      ..add(DiagnosticsProperty('clubLogo', clubLogo))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('followers', followers))
      ..add(DiagnosticsProperty('documentReference', documentReference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Club &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.moto, moto) ||
                const DeepCollectionEquality().equals(other.moto, moto)) &&
            (identical(other.clubBanner, clubBanner) ||
                const DeepCollectionEquality()
                    .equals(other.clubBanner, clubBanner)) &&
            (identical(other.clubLogo, clubLogo) ||
                const DeepCollectionEquality()
                    .equals(other.clubLogo, clubLogo)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.followers, followers) ||
                const DeepCollectionEquality()
                    .equals(other.followers, followers)) &&
            (identical(other.documentReference, documentReference) ||
                const DeepCollectionEquality()
                    .equals(other.documentReference, documentReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(moto) ^
      const DeepCollectionEquality().hash(clubBanner) ^
      const DeepCollectionEquality().hash(clubLogo) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(followers) ^
      const DeepCollectionEquality().hash(documentReference);

  @override
  _$ClubCopyWith<_Club> get copyWith =>
      __$ClubCopyWithImpl<_Club>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClubToJson(this);
  }
}

abstract class _Club extends Club {
  _Club._() : super._();
  factory _Club(
      {String id,
      String name,
      String moto,
      String clubBanner,
      String clubLogo,
      String description,
      String followers,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _$_Club;

  factory _Club.fromJson(Map<String, dynamic> json) = _$_Club.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get moto;
  @override
  String get clubBanner;
  @override
  String get clubLogo;
  @override
  String get description;
  @override
  String get followers;
  @override
  @JsonKey(ignore: true)
  DocumentReference get documentReference;
  @override
  _$ClubCopyWith<_Club> get copyWith;
}
