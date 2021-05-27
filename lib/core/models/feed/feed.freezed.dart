// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Feed _$FeedFromJson(Map<String, dynamic> json) {
  return _Feed.fromJson(json);
}

/// @nodoc
class _$FeedTearOff {
  const _$FeedTearOff();

// ignore: unused_element
  _Feed call(
      {String id,
      String fullName,
      String uid,
      String feedId,
      String title,
      String description,
      String link,
      String category,
      String timeStamp,
      String profileImg,
      @JsonKey(ignore: true) DocumentReference<Object> documentReference}) {
    return _Feed(
      id: id,
      fullName: fullName,
      uid: uid,
      feedId: feedId,
      title: title,
      description: description,
      link: link,
      category: category,
      timeStamp: timeStamp,
      profileImg: profileImg,
      documentReference: documentReference,
    );
  }

// ignore: unused_element
  Feed fromJson(Map<String, Object> json) {
    return Feed.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Feed = _$FeedTearOff();

/// @nodoc
mixin _$Feed {
  String get id;
  String get fullName;
  String get uid;
  String get feedId;
  String get title;
  String get description;
  String get link;
  String get category;
  String get timeStamp;
  String get profileImg;
  @JsonKey(ignore: true)
  DocumentReference<Object> get documentReference;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $FeedCopyWith<Feed> get copyWith;
}

/// @nodoc
abstract class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) then) =
      _$FeedCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String fullName,
      String uid,
      String feedId,
      String title,
      String description,
      String link,
      String category,
      String timeStamp,
      String profileImg,
      @JsonKey(ignore: true) DocumentReference<Object> documentReference});
}

/// @nodoc
class _$FeedCopyWithImpl<$Res> implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._value, this._then);

  final Feed _value;
  // ignore: unused_field
  final $Res Function(Feed) _then;

  @override
  $Res call({
    Object id = freezed,
    Object fullName = freezed,
    Object uid = freezed,
    Object feedId = freezed,
    Object title = freezed,
    Object description = freezed,
    Object link = freezed,
    Object category = freezed,
    Object timeStamp = freezed,
    Object profileImg = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      uid: uid == freezed ? _value.uid : uid as String,
      feedId: feedId == freezed ? _value.feedId : feedId as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      link: link == freezed ? _value.link : link as String,
      category: category == freezed ? _value.category : category as String,
      timeStamp: timeStamp == freezed ? _value.timeStamp : timeStamp as String,
      profileImg:
          profileImg == freezed ? _value.profileImg : profileImg as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference<Object>,
    ));
  }
}

/// @nodoc
abstract class _$FeedCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$FeedCopyWith(_Feed value, $Res Function(_Feed) then) =
      __$FeedCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String fullName,
      String uid,
      String feedId,
      String title,
      String description,
      String link,
      String category,
      String timeStamp,
      String profileImg,
      @JsonKey(ignore: true) DocumentReference<Object> documentReference});
}

/// @nodoc
class __$FeedCopyWithImpl<$Res> extends _$FeedCopyWithImpl<$Res>
    implements _$FeedCopyWith<$Res> {
  __$FeedCopyWithImpl(_Feed _value, $Res Function(_Feed) _then)
      : super(_value, (v) => _then(v as _Feed));

  @override
  _Feed get _value => super._value as _Feed;

  @override
  $Res call({
    Object id = freezed,
    Object fullName = freezed,
    Object uid = freezed,
    Object feedId = freezed,
    Object title = freezed,
    Object description = freezed,
    Object link = freezed,
    Object category = freezed,
    Object timeStamp = freezed,
    Object profileImg = freezed,
    Object documentReference = freezed,
  }) {
    return _then(_Feed(
      id: id == freezed ? _value.id : id as String,
      fullName: fullName == freezed ? _value.fullName : fullName as String,
      uid: uid == freezed ? _value.uid : uid as String,
      feedId: feedId == freezed ? _value.feedId : feedId as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      link: link == freezed ? _value.link : link as String,
      category: category == freezed ? _value.category : category as String,
      timeStamp: timeStamp == freezed ? _value.timeStamp : timeStamp as String,
      profileImg:
          profileImg == freezed ? _value.profileImg : profileImg as String,
      documentReference: documentReference == freezed
          ? _value.documentReference
          : documentReference as DocumentReference<Object>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Feed extends _Feed with DiagnosticableTreeMixin {
  _$_Feed(
      {this.id,
      this.fullName,
      this.uid,
      this.feedId,
      this.title,
      this.description,
      this.link,
      this.category,
      this.timeStamp,
      this.profileImg,
      @JsonKey(ignore: true) this.documentReference})
      : super._();

  factory _$_Feed.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final String uid;
  @override
  final String feedId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String link;
  @override
  final String category;
  @override
  final String timeStamp;
  @override
  final String profileImg;
  @override
  @JsonKey(ignore: true)
  final DocumentReference<Object> documentReference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Feed(id: $id, fullName: $fullName, uid: $uid, feedId: $feedId, title: $title, description: $description, link: $link, category: $category, timeStamp: $timeStamp, profileImg: $profileImg, documentReference: $documentReference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Feed'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('feedId', feedId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('timeStamp', timeStamp))
      ..add(DiagnosticsProperty('profileImg', profileImg))
      ..add(DiagnosticsProperty('documentReference', documentReference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Feed &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.feedId, feedId) ||
                const DeepCollectionEquality().equals(other.feedId, feedId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.timeStamp, timeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.timeStamp, timeStamp)) &&
            (identical(other.profileImg, profileImg) ||
                const DeepCollectionEquality()
                    .equals(other.profileImg, profileImg)) &&
            (identical(other.documentReference, documentReference) ||
                const DeepCollectionEquality()
                    .equals(other.documentReference, documentReference)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(feedId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(link) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(timeStamp) ^
      const DeepCollectionEquality().hash(profileImg) ^
      const DeepCollectionEquality().hash(documentReference);

  @JsonKey(ignore: true)
  @override
  _$FeedCopyWith<_Feed> get copyWith =>
      __$FeedCopyWithImpl<_Feed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedToJson(this);
  }
}

abstract class _Feed extends Feed {
  _Feed._() : super._();
  factory _Feed(
          {String id,
          String fullName,
          String uid,
          String feedId,
          String title,
          String description,
          String link,
          String category,
          String timeStamp,
          String profileImg,
          @JsonKey(ignore: true) DocumentReference<Object> documentReference}) =
      _$_Feed;

  factory _Feed.fromJson(Map<String, dynamic> json) = _$_Feed.fromJson;

  @override
  String get id;
  @override
  String get fullName;
  @override
  String get uid;
  @override
  String get feedId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get link;
  @override
  String get category;
  @override
  String get timeStamp;
  @override
  String get profileImg;
  @override
  @JsonKey(ignore: true)
  DocumentReference<Object> get documentReference;
  @override
  @JsonKey(ignore: true)
  _$FeedCopyWith<_Feed> get copyWith;
}
