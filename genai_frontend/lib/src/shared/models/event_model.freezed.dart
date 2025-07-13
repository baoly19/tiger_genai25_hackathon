// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get organizerId => throw _privateConstructorUsedError;
  String get organizerName => throw _privateConstructorUsedError;
  String? get organizerAvatarUrl => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get courtId => throw _privateConstructorUsedError;
  List<String> get sportTypes => throw _privateConstructorUsedError;
  int get maxParticipants => throw _privateConstructorUsedError;
  List<EventParticipant> get participants => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String get priceType =>
      throw _privateConstructorUsedError; // free, paid, donation
  String get registrationStatus =>
      throw _privateConstructorUsedError; // open, closed, full
  String get status =>
      throw _privateConstructorUsedError; // upcoming, ongoing, completed, cancelled
  List<String> get imageUrls => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get requirements =>
      throw _privateConstructorUsedError; // skill level, equipment, etc.
  DateTime? get registrationDeadline => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this EventModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String organizerId,
      String organizerName,
      String? organizerAvatarUrl,
      DateTime startTime,
      DateTime endTime,
      String location,
      double? latitude,
      double? longitude,
      String? courtId,
      List<String> sportTypes,
      int maxParticipants,
      List<EventParticipant> participants,
      double? price,
      String priceType,
      String registrationStatus,
      String status,
      List<String> imageUrls,
      List<String> tags,
      String? requirements,
      DateTime? registrationDeadline,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? organizerId = null,
    Object? organizerName = null,
    Object? organizerAvatarUrl = freezed,
    Object? startTime = null,
    Object? endTime = null,
    Object? location = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? courtId = freezed,
    Object? sportTypes = null,
    Object? maxParticipants = null,
    Object? participants = null,
    Object? price = freezed,
    Object? priceType = null,
    Object? registrationStatus = null,
    Object? status = null,
    Object? imageUrls = null,
    Object? tags = null,
    Object? requirements = freezed,
    Object? registrationDeadline = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerName: null == organizerName
          ? _value.organizerName
          : organizerName // ignore: cast_nullable_to_non_nullable
              as String,
      organizerAvatarUrl: freezed == organizerAvatarUrl
          ? _value.organizerAvatarUrl
          : organizerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      courtId: freezed == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String?,
      sportTypes: null == sportTypes
          ? _value.sportTypes
          : sportTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maxParticipants: null == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<EventParticipant>,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      registrationStatus: null == registrationStatus
          ? _value.registrationStatus
          : registrationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requirements: freezed == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDeadline: freezed == registrationDeadline
          ? _value.registrationDeadline
          : registrationDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventModelImplCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$EventModelImplCopyWith(
          _$EventModelImpl value, $Res Function(_$EventModelImpl) then) =
      __$$EventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String organizerId,
      String organizerName,
      String? organizerAvatarUrl,
      DateTime startTime,
      DateTime endTime,
      String location,
      double? latitude,
      double? longitude,
      String? courtId,
      List<String> sportTypes,
      int maxParticipants,
      List<EventParticipant> participants,
      double? price,
      String priceType,
      String registrationStatus,
      String status,
      List<String> imageUrls,
      List<String> tags,
      String? requirements,
      DateTime? registrationDeadline,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$EventModelImplCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$EventModelImpl>
    implements _$$EventModelImplCopyWith<$Res> {
  __$$EventModelImplCopyWithImpl(
      _$EventModelImpl _value, $Res Function(_$EventModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? organizerId = null,
    Object? organizerName = null,
    Object? organizerAvatarUrl = freezed,
    Object? startTime = null,
    Object? endTime = null,
    Object? location = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? courtId = freezed,
    Object? sportTypes = null,
    Object? maxParticipants = null,
    Object? participants = null,
    Object? price = freezed,
    Object? priceType = null,
    Object? registrationStatus = null,
    Object? status = null,
    Object? imageUrls = null,
    Object? tags = null,
    Object? requirements = freezed,
    Object? registrationDeadline = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EventModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerName: null == organizerName
          ? _value.organizerName
          : organizerName // ignore: cast_nullable_to_non_nullable
              as String,
      organizerAvatarUrl: freezed == organizerAvatarUrl
          ? _value.organizerAvatarUrl
          : organizerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      courtId: freezed == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String?,
      sportTypes: null == sportTypes
          ? _value._sportTypes
          : sportTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      maxParticipants: null == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<EventParticipant>,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      priceType: null == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      registrationStatus: null == registrationStatus
          ? _value.registrationStatus
          : registrationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requirements: freezed == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDeadline: freezed == registrationDeadline
          ? _value.registrationDeadline
          : registrationDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventModelImpl implements _EventModel {
  const _$EventModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.organizerId,
      required this.organizerName,
      this.organizerAvatarUrl,
      required this.startTime,
      required this.endTime,
      required this.location,
      this.latitude,
      this.longitude,
      this.courtId,
      final List<String> sportTypes = const [],
      this.maxParticipants = 0,
      final List<EventParticipant> participants = const [],
      this.price,
      this.priceType = 'free',
      this.registrationStatus = 'open',
      this.status = 'upcoming',
      final List<String> imageUrls = const [],
      final List<String> tags = const [],
      this.requirements,
      this.registrationDeadline,
      this.createdAt,
      this.updatedAt})
      : _sportTypes = sportTypes,
        _participants = participants,
        _imageUrls = imageUrls,
        _tags = tags;

  factory _$EventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String organizerId;
  @override
  final String organizerName;
  @override
  final String? organizerAvatarUrl;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String location;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? courtId;
  final List<String> _sportTypes;
  @override
  @JsonKey()
  List<String> get sportTypes {
    if (_sportTypes is EqualUnmodifiableListView) return _sportTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sportTypes);
  }

  @override
  @JsonKey()
  final int maxParticipants;
  final List<EventParticipant> _participants;
  @override
  @JsonKey()
  List<EventParticipant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final double? price;
  @override
  @JsonKey()
  final String priceType;
// free, paid, donation
  @override
  @JsonKey()
  final String registrationStatus;
// open, closed, full
  @override
  @JsonKey()
  final String status;
// upcoming, ongoing, completed, cancelled
  final List<String> _imageUrls;
// upcoming, ongoing, completed, cancelled
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? requirements;
// skill level, equipment, etc.
  @override
  final DateTime? registrationDeadline;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'EventModel(id: $id, title: $title, description: $description, organizerId: $organizerId, organizerName: $organizerName, organizerAvatarUrl: $organizerAvatarUrl, startTime: $startTime, endTime: $endTime, location: $location, latitude: $latitude, longitude: $longitude, courtId: $courtId, sportTypes: $sportTypes, maxParticipants: $maxParticipants, participants: $participants, price: $price, priceType: $priceType, registrationStatus: $registrationStatus, status: $status, imageUrls: $imageUrls, tags: $tags, requirements: $requirements, registrationDeadline: $registrationDeadline, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.organizerName, organizerName) ||
                other.organizerName == organizerName) &&
            (identical(other.organizerAvatarUrl, organizerAvatarUrl) ||
                other.organizerAvatarUrl == organizerAvatarUrl) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.courtId, courtId) || other.courtId == courtId) &&
            const DeepCollectionEquality()
                .equals(other._sportTypes, _sportTypes) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.registrationStatus, registrationStatus) ||
                other.registrationStatus == registrationStatus) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.requirements, requirements) ||
                other.requirements == requirements) &&
            (identical(other.registrationDeadline, registrationDeadline) ||
                other.registrationDeadline == registrationDeadline) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        organizerId,
        organizerName,
        organizerAvatarUrl,
        startTime,
        endTime,
        location,
        latitude,
        longitude,
        courtId,
        const DeepCollectionEquality().hash(_sportTypes),
        maxParticipants,
        const DeepCollectionEquality().hash(_participants),
        price,
        priceType,
        registrationStatus,
        status,
        const DeepCollectionEquality().hash(_imageUrls),
        const DeepCollectionEquality().hash(_tags),
        requirements,
        registrationDeadline,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      __$$EventModelImplCopyWithImpl<_$EventModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventModelImplToJson(
      this,
    );
  }
}

abstract class _EventModel implements EventModel {
  const factory _EventModel(
      {required final String id,
      required final String title,
      required final String description,
      required final String organizerId,
      required final String organizerName,
      final String? organizerAvatarUrl,
      required final DateTime startTime,
      required final DateTime endTime,
      required final String location,
      final double? latitude,
      final double? longitude,
      final String? courtId,
      final List<String> sportTypes,
      final int maxParticipants,
      final List<EventParticipant> participants,
      final double? price,
      final String priceType,
      final String registrationStatus,
      final String status,
      final List<String> imageUrls,
      final List<String> tags,
      final String? requirements,
      final DateTime? registrationDeadline,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$EventModelImpl;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$EventModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get organizerId;
  @override
  String get organizerName;
  @override
  String? get organizerAvatarUrl;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String get location;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get courtId;
  @override
  List<String> get sportTypes;
  @override
  int get maxParticipants;
  @override
  List<EventParticipant> get participants;
  @override
  double? get price;
  @override
  String get priceType; // free, paid, donation
  @override
  String get registrationStatus; // open, closed, full
  @override
  String get status; // upcoming, ongoing, completed, cancelled
  @override
  List<String> get imageUrls;
  @override
  List<String> get tags;
  @override
  String? get requirements; // skill level, equipment, etc.
  @override
  DateTime? get registrationDeadline;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventParticipant _$EventParticipantFromJson(Map<String, dynamic> json) {
  return _EventParticipant.fromJson(json);
}

/// @nodoc
mixin _$EventParticipant {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get userAvatarUrl => throw _privateConstructorUsedError;
  DateTime get registeredAt => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // registered, waitlist, cancelled
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this EventParticipant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventParticipantCopyWith<EventParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventParticipantCopyWith<$Res> {
  factory $EventParticipantCopyWith(
          EventParticipant value, $Res Function(EventParticipant) then) =
      _$EventParticipantCopyWithImpl<$Res, EventParticipant>;
  @useResult
  $Res call(
      {String userId,
      String userName,
      String? userAvatarUrl,
      DateTime registeredAt,
      String status,
      String? notes});
}

/// @nodoc
class _$EventParticipantCopyWithImpl<$Res, $Val extends EventParticipant>
    implements $EventParticipantCopyWith<$Res> {
  _$EventParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? userAvatarUrl = freezed,
    Object? registeredAt = null,
    Object? status = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userAvatarUrl: freezed == userAvatarUrl
          ? _value.userAvatarUrl
          : userAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventParticipantImplCopyWith<$Res>
    implements $EventParticipantCopyWith<$Res> {
  factory _$$EventParticipantImplCopyWith(_$EventParticipantImpl value,
          $Res Function(_$EventParticipantImpl) then) =
      __$$EventParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String userName,
      String? userAvatarUrl,
      DateTime registeredAt,
      String status,
      String? notes});
}

/// @nodoc
class __$$EventParticipantImplCopyWithImpl<$Res>
    extends _$EventParticipantCopyWithImpl<$Res, _$EventParticipantImpl>
    implements _$$EventParticipantImplCopyWith<$Res> {
  __$$EventParticipantImplCopyWithImpl(_$EventParticipantImpl _value,
      $Res Function(_$EventParticipantImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? userAvatarUrl = freezed,
    Object? registeredAt = null,
    Object? status = null,
    Object? notes = freezed,
  }) {
    return _then(_$EventParticipantImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userAvatarUrl: freezed == userAvatarUrl
          ? _value.userAvatarUrl
          : userAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventParticipantImpl implements _EventParticipant {
  const _$EventParticipantImpl(
      {required this.userId,
      required this.userName,
      this.userAvatarUrl,
      required this.registeredAt,
      this.status = 'registered',
      this.notes});

  factory _$EventParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventParticipantImplFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String? userAvatarUrl;
  @override
  final DateTime registeredAt;
  @override
  @JsonKey()
  final String status;
// registered, waitlist, cancelled
  @override
  final String? notes;

  @override
  String toString() {
    return 'EventParticipant(userId: $userId, userName: $userName, userAvatarUrl: $userAvatarUrl, registeredAt: $registeredAt, status: $status, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventParticipantImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userAvatarUrl, userAvatarUrl) ||
                other.userAvatarUrl == userAvatarUrl) &&
            (identical(other.registeredAt, registeredAt) ||
                other.registeredAt == registeredAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, userAvatarUrl,
      registeredAt, status, notes);

  /// Create a copy of EventParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventParticipantImplCopyWith<_$EventParticipantImpl> get copyWith =>
      __$$EventParticipantImplCopyWithImpl<_$EventParticipantImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventParticipantImplToJson(
      this,
    );
  }
}

abstract class _EventParticipant implements EventParticipant {
  const factory _EventParticipant(
      {required final String userId,
      required final String userName,
      final String? userAvatarUrl,
      required final DateTime registeredAt,
      final String status,
      final String? notes}) = _$EventParticipantImpl;

  factory _EventParticipant.fromJson(Map<String, dynamic> json) =
      _$EventParticipantImpl.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String? get userAvatarUrl;
  @override
  DateTime get registeredAt;
  @override
  String get status; // registered, waitlist, cancelled
  @override
  String? get notes;

  /// Create a copy of EventParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventParticipantImplCopyWith<_$EventParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
