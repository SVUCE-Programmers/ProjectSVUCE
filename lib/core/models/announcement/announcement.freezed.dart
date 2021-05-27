// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'announcement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Announcement _$AnnouncementFromJson(Map<String, dynamic> json) {
  return _Announcement.fromJson(json);
}

/// @nodoc
class _$AnnouncementTearOff {
  const _$AnnouncementTearOff();

// ignore: unused_element
  _Announcement call(
      {String id,
      String timeStamp,
      String desc,
      String type,
      String imgUrl,
      @JsonKey(ignore: true) DocumentReference<Object> documentReference}) {
    return _Announcement(
      id: id,
      timeStamp: timeStamp,
      desc: desc,
      type: type,
      imgUrl: imgUrl,
      documentReference: documentReference,
    );
  }

// ignore: unused_element
  Announcement fromJson(Map<String, Object> json) {
    return Announcement.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Announcement = _$AnnouncementTearOff();

/// @nodoc
mixin _$Announcement {
  String get id;
  String get timeStamp;
  String get desc;
  String get type;
  String get imgUrl;
  @JsonKey(ignore: true)
  DocumentReference<Object> get documentReference;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AnnouncementCopyWith<Announcement> get copyWith;
}

/// @nodoc
abstract class $AnnouncementCopyWith<$Res> {
  factory $AnnouncementCopyWith(
          Announcement value, $Res Function(Announcement) then) =
      _$AnnouncementCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String timeStamp,
      String desc,
      String type,
      String imgUrl,
      @JsonKey(ignore: true) DocumentReference<Object> documentReference});
}

/// @nodoc
class _$AnnouncementCopyWithImpl<$Res> implements $AnnouncementCopyWith<$Res> {
  _$AnnouncementCopyWithImpl(this._value, this._then);

  final Announcement _value;
  // ignore: unused_field
  final $Res Function(Announcement) _then;

  @override
  $Res call({
    Object id = freezed,
    Object timeStamp = freezed,
    Object desc = freezed,
    Object type = freezed,
    Object imgUrl = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      timeStamp: timeStamp == freezed ? _value.timeStamp : timeStamp as String,
      desc: desc == freezed ? _value.desc : desc as String,
      type: type == freezed ? _value.type : type as String,
      imgUrl: imgUrl == freezed ? _value.imgUrl : imgUrl as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference<Object>,
    ));
  }
}

/// @nodoc
abstract class _$AnnouncementCopyWith<$Res>
    implements $AnnouncementCopyWith<$Res> {
  factory _$AnnouncementCopyWith(
          _Announcement value, $Res Function(_Announcement) then) =
      __$AnnouncementCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String timeStamp,
      String desc,
      String type,
      String imgUrl,
      @JsonKey(ignore: true) DocumentReference<Object> documentReference});
}

/// @nodoc
class __$AnnouncementCopyWithImpl<$Res> extends _$AnnouncementCopyWithImpl<$Res>
    implements _$AnnouncementCopyWith<$Res> {
  __$AnnouncementCopyWithImpl(
      _Announcement _value, $Res Function(_Announcement) _then)
      : super(_value, (v) => _then(v as _Announcement));

  @override
  _Announcement get _value => super._value as _Announcement;

  @override
  $Res call({
    Object id = freezed,
    Object timeStamp = freezed,
    Object desc = freezed,
    Object type = freezed,
    Object imgUrl = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_Announcement(
      id: id == freezed ? _value.id : id as String,
      timeStamp: timeStamp == freezed ? _value.timeStamp : timeStamp as String,
      desc: desc == freezed ? _value.desc : desc as String,
      type: type == freezed ? _value.type : type as String,
      imgUrl: imgUrl == freezed ? _value.imgUrl : imgUrl as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference<Object>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Announcement extends _Announcement with DiagnosticableTreeMixin {
  _$_Announcement(
      {this.id,
      this.timeStamp,
      this.desc,
      this.type,
      this.imgUrl,
      @JsonKey(ignore: true) this.documentReference})
      : super._();

  factory _$_Announcement.fromJson(Map<String, dynamic> json) =>
      _$_$_AnnouncementFromJson(json);

  @override
  final String id;
  @override
  final String timeStamp;
  @override
  final String desc;
  @override
  final String type;
  @override
  final String imgUrl;
  @override
  @JsonKey(ignore: true)
  final DocumentReference<Object> documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Announcement(id: $id, timeStamp: $timeStamp, desc: $desc, type: $type, imgUrl: $imgUrl, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Announcement'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('timeStamp', timeStamp))
      ..add(DiagnosticsProperty('desc', desc))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('imgUrl', imgUrl))
      ..add(DiagnosticsProperty('documentReference', documentReference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Announcement &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.timeStamp, timeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.timeStamp, timeStamp)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.imgUrl, imgUrl) ||
                const DeepCollectionEquality().equals(other.imgUrl, imgUrl)) &&
            (identical(other.documentReference, documentReference) ||
                const DeepCollectionEquality()
                    .equals(other.documentReference, documentReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(timeStamp) ^
      const DeepCollectionEquality().hash(desc) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(imgUrl) ^
      const DeepCollectionEquality().hash(documentReference);

  @JsonKey(ignore: true)
  @override
  _$AnnouncementCopyWith<_Announcement> get copyWith =>
      __$AnnouncementCopyWithImpl<_Announcement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AnnouncementToJson(this);
  }
}

abstract class _Announcement extends Announcement {
  _Announcement._() : super._();
  factory _Announcement(
          {String id,
          String timeStamp,
          String desc,
          String type,
          String imgUrl,
          @JsonKey(ignore: true) DocumentReference<Object> documentReference}) =
      _$_Announcement;

  factory _Announcement.fromJson(Map<String, dynamic> json) =
      _$_Announcement.fromJson;

  @override
  String get id;
  @override
  String get timeStamp;
  @override
  String get desc;
  @override
  String get type;
  @override
  String get imgUrl;
  @override
  @JsonKey(ignore: true)
  DocumentReference<Object> get documentReference;
  @override
  @JsonKey(ignore: true)
  _$AnnouncementCopyWith<_Announcement> get copyWith;
}
