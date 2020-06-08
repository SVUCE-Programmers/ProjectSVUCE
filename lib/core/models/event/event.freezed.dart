// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {String id,
      String name,
      String organiser,
      String place,
      String timeStamp,
      String imageUrl,
      String description,
      @JsonKey(ignore: true) DocumentReference documentReference}) {
    return _Event(
      id: id,
      name: name,
      organiser: organiser,
      place: place,
      timeStamp: timeStamp,
      imageUrl: imageUrl,
      description: description,
      documentReference: documentReference,
    );
  }
}

// ignore: unused_element
const $Event = _$EventTearOff();

mixin _$Event {
  String get id;
  String get name;
  String get organiser;
  String get place;
  String get timeStamp;
  String get imageUrl;
  String get description;
  @JsonKey(ignore: true)
  DocumentReference get documentReference;

  Map<String, dynamic> toJson();
  $EventCopyWith<Event> get copyWith;
}

abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String organiser,
      String place,
      String timeStamp,
      String imageUrl,
      String description,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object organiser = freezed,
    Object place = freezed,
    Object timeStamp = freezed,
    Object imageUrl = freezed,
    Object description = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      organiser: organiser == freezed ? _value.organiser : organiser as String,
      place: place == freezed ? _value.place : place as String,
      timeStamp: timeStamp == freezed ? _value.timeStamp : timeStamp as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      description:
          description == freezed ? _value.description : description as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String organiser,
      String place,
      String timeStamp,
      String imageUrl,
      String description,
      @JsonKey(ignore: true) DocumentReference documentReference});
}

class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object organiser = freezed,
    Object place = freezed,
    Object timeStamp = freezed,
    Object imageUrl = freezed,
    Object description = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_Event(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      organiser: organiser == freezed ? _value.organiser : organiser as String,
      place: place == freezed ? _value.place : place as String,
      timeStamp: timeStamp == freezed ? _value.timeStamp : timeStamp as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      description:
          description == freezed ? _value.description : description as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference,
    ));
  }
}

@JsonSerializable()
class _$_Event extends _Event with DiagnosticableTreeMixin {
  _$_Event(
      {this.id,
      this.name,
      this.organiser,
      this.place,
      this.timeStamp,
      this.imageUrl,
      this.description,
      @JsonKey(ignore: true) this.documentReference})
      : super._();

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$_$_EventFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String organiser;
  @override
  final String place;
  @override
  final String timeStamp;
  @override
  final String imageUrl;
  @override
  final String description;
  @override
  @JsonKey(ignore: true)
  final DocumentReference documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(id: $id, name: $name, organiser: $organiser, place: $place, timeStamp: $timeStamp, imageUrl: $imageUrl, description: $description, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('organiser', organiser))
      ..add(DiagnosticsProperty('place', place))
      ..add(DiagnosticsProperty('timeStamp', timeStamp))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('documentReference', documentReference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Event &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.organiser, organiser) ||
                const DeepCollectionEquality()
                    .equals(other.organiser, organiser)) &&
            (identical(other.place, place) ||
                const DeepCollectionEquality().equals(other.place, place)) &&
            (identical(other.timeStamp, timeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.timeStamp, timeStamp)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.documentReference, documentReference) ||
                const DeepCollectionEquality()
                    .equals(other.documentReference, documentReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(organiser) ^
      const DeepCollectionEquality().hash(place) ^
      const DeepCollectionEquality().hash(timeStamp) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(documentReference);

  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventToJson(this);
  }
}

abstract class _Event extends Event {
  _Event._() : super._();
  factory _Event(
      {String id,
      String name,
      String organiser,
      String place,
      String timeStamp,
      String imageUrl,
      String description,
      @JsonKey(ignore: true) DocumentReference documentReference}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get organiser;
  @override
  String get place;
  @override
  String get timeStamp;
  @override
  String get imageUrl;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  DocumentReference get documentReference;
  @override
  _$EventCopyWith<_Event> get copyWith;
}
