// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'court_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourtModel _$CourtModelFromJson(Map<String, dynamic> json) {
  return _CourtModel.fromJson(json);
}

/// @nodoc
mixin _$CourtModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  List<String> get sportTypes =>
      throw _privateConstructorUsedError; // tennis, basketball, badminton, etc.
  double get pricePerHour => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  Map<String, dynamic> get amenities =>
      throw _privateConstructorUsedError; // parking, changing_room, equipment_rental, etc.
  String get status =>
      throw _privateConstructorUsedError; // active, inactive, maintenance
  List<CourtSchedule> get schedules => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get totalReviews => throw _privateConstructorUsedError;
  List<String> get availableTimeSlots => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CourtModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourtModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourtModelCopyWith<CourtModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtModelCopyWith<$Res> {
  factory $CourtModelCopyWith(
          CourtModel value, $Res Function(CourtModel) then) =
      _$CourtModelCopyWithImpl<$Res, CourtModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String location,
      double latitude,
      double longitude,
      String ownerId,
      List<String> sportTypes,
      double pricePerHour,
      List<String> imageUrls,
      Map<String, dynamic> amenities,
      String status,
      List<CourtSchedule> schedules,
      double rating,
      int totalReviews,
      List<String> availableTimeSlots,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CourtModelCopyWithImpl<$Res, $Val extends CourtModel>
    implements $CourtModelCopyWith<$Res> {
  _$CourtModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourtModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? location = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? ownerId = null,
    Object? sportTypes = null,
    Object? pricePerHour = null,
    Object? imageUrls = null,
    Object? amenities = null,
    Object? status = null,
    Object? schedules = null,
    Object? rating = null,
    Object? totalReviews = null,
    Object? availableTimeSlots = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      sportTypes: null == sportTypes
          ? _value.sportTypes
          : sportTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pricePerHour: null == pricePerHour
          ? _value.pricePerHour
          : pricePerHour // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      amenities: null == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<CourtSchedule>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviews: null == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
      availableTimeSlots: null == availableTimeSlots
          ? _value.availableTimeSlots
          : availableTimeSlots // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$CourtModelImplCopyWith<$Res>
    implements $CourtModelCopyWith<$Res> {
  factory _$$CourtModelImplCopyWith(
          _$CourtModelImpl value, $Res Function(_$CourtModelImpl) then) =
      __$$CourtModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String location,
      double latitude,
      double longitude,
      String ownerId,
      List<String> sportTypes,
      double pricePerHour,
      List<String> imageUrls,
      Map<String, dynamic> amenities,
      String status,
      List<CourtSchedule> schedules,
      double rating,
      int totalReviews,
      List<String> availableTimeSlots,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CourtModelImplCopyWithImpl<$Res>
    extends _$CourtModelCopyWithImpl<$Res, _$CourtModelImpl>
    implements _$$CourtModelImplCopyWith<$Res> {
  __$$CourtModelImplCopyWithImpl(
      _$CourtModelImpl _value, $Res Function(_$CourtModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourtModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? location = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? ownerId = null,
    Object? sportTypes = null,
    Object? pricePerHour = null,
    Object? imageUrls = null,
    Object? amenities = null,
    Object? status = null,
    Object? schedules = null,
    Object? rating = null,
    Object? totalReviews = null,
    Object? availableTimeSlots = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CourtModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      sportTypes: null == sportTypes
          ? _value._sportTypes
          : sportTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pricePerHour: null == pricePerHour
          ? _value.pricePerHour
          : pricePerHour // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      amenities: null == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<CourtSchedule>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviews: null == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
      availableTimeSlots: null == availableTimeSlots
          ? _value._availableTimeSlots
          : availableTimeSlots // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$CourtModelImpl implements _CourtModel {
  const _$CourtModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.location,
      required this.latitude,
      required this.longitude,
      required this.ownerId,
      final List<String> sportTypes = const [],
      required this.pricePerHour,
      final List<String> imageUrls = const [],
      final Map<String, dynamic> amenities = const {},
      this.status = 'active',
      final List<CourtSchedule> schedules = const [],
      this.rating = 0.0,
      this.totalReviews = 0,
      final List<String> availableTimeSlots = const [],
      this.createdAt,
      this.updatedAt})
      : _sportTypes = sportTypes,
        _imageUrls = imageUrls,
        _amenities = amenities,
        _schedules = schedules,
        _availableTimeSlots = availableTimeSlots;

  factory _$CourtModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourtModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String location;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String ownerId;
  final List<String> _sportTypes;
  @override
  @JsonKey()
  List<String> get sportTypes {
    if (_sportTypes is EqualUnmodifiableListView) return _sportTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sportTypes);
  }

// tennis, basketball, badminton, etc.
  @override
  final double pricePerHour;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final Map<String, dynamic> _amenities;
  @override
  @JsonKey()
  Map<String, dynamic> get amenities {
    if (_amenities is EqualUnmodifiableMapView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_amenities);
  }

// parking, changing_room, equipment_rental, etc.
  @override
  @JsonKey()
  final String status;
// active, inactive, maintenance
  final List<CourtSchedule> _schedules;
// active, inactive, maintenance
  @override
  @JsonKey()
  List<CourtSchedule> get schedules {
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int totalReviews;
  final List<String> _availableTimeSlots;
  @override
  @JsonKey()
  List<String> get availableTimeSlots {
    if (_availableTimeSlots is EqualUnmodifiableListView)
      return _availableTimeSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableTimeSlots);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CourtModel(id: $id, name: $name, description: $description, location: $location, latitude: $latitude, longitude: $longitude, ownerId: $ownerId, sportTypes: $sportTypes, pricePerHour: $pricePerHour, imageUrls: $imageUrls, amenities: $amenities, status: $status, schedules: $schedules, rating: $rating, totalReviews: $totalReviews, availableTimeSlots: $availableTimeSlots, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourtModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            const DeepCollectionEquality()
                .equals(other._sportTypes, _sportTypes) &&
            (identical(other.pricePerHour, pricePerHour) ||
                other.pricePerHour == pricePerHour) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            const DeepCollectionEquality()
                .equals(other._availableTimeSlots, _availableTimeSlots) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      location,
      latitude,
      longitude,
      ownerId,
      const DeepCollectionEquality().hash(_sportTypes),
      pricePerHour,
      const DeepCollectionEquality().hash(_imageUrls),
      const DeepCollectionEquality().hash(_amenities),
      status,
      const DeepCollectionEquality().hash(_schedules),
      rating,
      totalReviews,
      const DeepCollectionEquality().hash(_availableTimeSlots),
      createdAt,
      updatedAt);

  /// Create a copy of CourtModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourtModelImplCopyWith<_$CourtModelImpl> get copyWith =>
      __$$CourtModelImplCopyWithImpl<_$CourtModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourtModelImplToJson(
      this,
    );
  }
}

abstract class _CourtModel implements CourtModel {
  const factory _CourtModel(
      {required final String id,
      required final String name,
      required final String description,
      required final String location,
      required final double latitude,
      required final double longitude,
      required final String ownerId,
      final List<String> sportTypes,
      required final double pricePerHour,
      final List<String> imageUrls,
      final Map<String, dynamic> amenities,
      final String status,
      final List<CourtSchedule> schedules,
      final double rating,
      final int totalReviews,
      final List<String> availableTimeSlots,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CourtModelImpl;

  factory _CourtModel.fromJson(Map<String, dynamic> json) =
      _$CourtModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get location;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get ownerId;
  @override
  List<String> get sportTypes; // tennis, basketball, badminton, etc.
  @override
  double get pricePerHour;
  @override
  List<String> get imageUrls;
  @override
  Map<String, dynamic>
      get amenities; // parking, changing_room, equipment_rental, etc.
  @override
  String get status; // active, inactive, maintenance
  @override
  List<CourtSchedule> get schedules;
  @override
  double get rating;
  @override
  int get totalReviews;
  @override
  List<String> get availableTimeSlots;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CourtModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourtModelImplCopyWith<_$CourtModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourtSchedule _$CourtScheduleFromJson(Map<String, dynamic> json) {
  return _CourtSchedule.fromJson(json);
}

/// @nodoc
mixin _$CourtSchedule {
  String get dayOfWeek =>
      throw _privateConstructorUsedError; // monday, tuesday, etc.
  String get openTime => throw _privateConstructorUsedError; // 08:00
  String get closeTime => throw _privateConstructorUsedError; // 22:00
  bool get isOpen => throw _privateConstructorUsedError;
  List<String> get blockedSlots => throw _privateConstructorUsedError;

  /// Serializes this CourtSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourtSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourtScheduleCopyWith<CourtSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtScheduleCopyWith<$Res> {
  factory $CourtScheduleCopyWith(
          CourtSchedule value, $Res Function(CourtSchedule) then) =
      _$CourtScheduleCopyWithImpl<$Res, CourtSchedule>;
  @useResult
  $Res call(
      {String dayOfWeek,
      String openTime,
      String closeTime,
      bool isOpen,
      List<String> blockedSlots});
}

/// @nodoc
class _$CourtScheduleCopyWithImpl<$Res, $Val extends CourtSchedule>
    implements $CourtScheduleCopyWith<$Res> {
  _$CourtScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourtSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? isOpen = null,
    Object? blockedSlots = null,
  }) {
    return _then(_value.copyWith(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedSlots: null == blockedSlots
          ? _value.blockedSlots
          : blockedSlots // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourtScheduleImplCopyWith<$Res>
    implements $CourtScheduleCopyWith<$Res> {
  factory _$$CourtScheduleImplCopyWith(
          _$CourtScheduleImpl value, $Res Function(_$CourtScheduleImpl) then) =
      __$$CourtScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dayOfWeek,
      String openTime,
      String closeTime,
      bool isOpen,
      List<String> blockedSlots});
}

/// @nodoc
class __$$CourtScheduleImplCopyWithImpl<$Res>
    extends _$CourtScheduleCopyWithImpl<$Res, _$CourtScheduleImpl>
    implements _$$CourtScheduleImplCopyWith<$Res> {
  __$$CourtScheduleImplCopyWithImpl(
      _$CourtScheduleImpl _value, $Res Function(_$CourtScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourtSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? isOpen = null,
    Object? blockedSlots = null,
  }) {
    return _then(_$CourtScheduleImpl(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedSlots: null == blockedSlots
          ? _value._blockedSlots
          : blockedSlots // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourtScheduleImpl implements _CourtSchedule {
  const _$CourtScheduleImpl(
      {required this.dayOfWeek,
      required this.openTime,
      required this.closeTime,
      this.isOpen = true,
      final List<String> blockedSlots = const []})
      : _blockedSlots = blockedSlots;

  factory _$CourtScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourtScheduleImplFromJson(json);

  @override
  final String dayOfWeek;
// monday, tuesday, etc.
  @override
  final String openTime;
// 08:00
  @override
  final String closeTime;
// 22:00
  @override
  @JsonKey()
  final bool isOpen;
  final List<String> _blockedSlots;
  @override
  @JsonKey()
  List<String> get blockedSlots {
    if (_blockedSlots is EqualUnmodifiableListView) return _blockedSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedSlots);
  }

  @override
  String toString() {
    return 'CourtSchedule(dayOfWeek: $dayOfWeek, openTime: $openTime, closeTime: $closeTime, isOpen: $isOpen, blockedSlots: $blockedSlots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourtScheduleImpl &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            const DeepCollectionEquality()
                .equals(other._blockedSlots, _blockedSlots));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dayOfWeek, openTime, closeTime,
      isOpen, const DeepCollectionEquality().hash(_blockedSlots));

  /// Create a copy of CourtSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourtScheduleImplCopyWith<_$CourtScheduleImpl> get copyWith =>
      __$$CourtScheduleImplCopyWithImpl<_$CourtScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourtScheduleImplToJson(
      this,
    );
  }
}

abstract class _CourtSchedule implements CourtSchedule {
  const factory _CourtSchedule(
      {required final String dayOfWeek,
      required final String openTime,
      required final String closeTime,
      final bool isOpen,
      final List<String> blockedSlots}) = _$CourtScheduleImpl;

  factory _CourtSchedule.fromJson(Map<String, dynamic> json) =
      _$CourtScheduleImpl.fromJson;

  @override
  String get dayOfWeek; // monday, tuesday, etc.
  @override
  String get openTime; // 08:00
  @override
  String get closeTime; // 22:00
  @override
  bool get isOpen;
  @override
  List<String> get blockedSlots;

  /// Create a copy of CourtSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourtScheduleImplCopyWith<_$CourtScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourtReview _$CourtReviewFromJson(Map<String, dynamic> json) {
  return _CourtReview.fromJson(json);
}

/// @nodoc
mixin _$CourtReview {
  String get id => throw _privateConstructorUsedError;
  String get courtId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get userAvatarUrl => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CourtReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourtReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourtReviewCopyWith<CourtReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtReviewCopyWith<$Res> {
  factory $CourtReviewCopyWith(
          CourtReview value, $Res Function(CourtReview) then) =
      _$CourtReviewCopyWithImpl<$Res, CourtReview>;
  @useResult
  $Res call(
      {String id,
      String courtId,
      String userId,
      String userName,
      String? userAvatarUrl,
      double rating,
      String? comment,
      List<String> imageUrls,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CourtReviewCopyWithImpl<$Res, $Val extends CourtReview>
    implements $CourtReviewCopyWith<$Res> {
  _$CourtReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourtReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courtId = null,
    Object? userId = null,
    Object? userName = null,
    Object? userAvatarUrl = freezed,
    Object? rating = null,
    Object? comment = freezed,
    Object? imageUrls = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
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
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$CourtReviewImplCopyWith<$Res>
    implements $CourtReviewCopyWith<$Res> {
  factory _$$CourtReviewImplCopyWith(
          _$CourtReviewImpl value, $Res Function(_$CourtReviewImpl) then) =
      __$$CourtReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String courtId,
      String userId,
      String userName,
      String? userAvatarUrl,
      double rating,
      String? comment,
      List<String> imageUrls,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$CourtReviewImplCopyWithImpl<$Res>
    extends _$CourtReviewCopyWithImpl<$Res, _$CourtReviewImpl>
    implements _$$CourtReviewImplCopyWith<$Res> {
  __$$CourtReviewImplCopyWithImpl(
      _$CourtReviewImpl _value, $Res Function(_$CourtReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourtReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courtId = null,
    Object? userId = null,
    Object? userName = null,
    Object? userAvatarUrl = freezed,
    Object? rating = null,
    Object? comment = freezed,
    Object? imageUrls = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CourtReviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
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
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$CourtReviewImpl implements _CourtReview {
  const _$CourtReviewImpl(
      {required this.id,
      required this.courtId,
      required this.userId,
      required this.userName,
      this.userAvatarUrl,
      required this.rating,
      this.comment,
      final List<String> imageUrls = const [],
      this.createdAt,
      this.updatedAt})
      : _imageUrls = imageUrls;

  factory _$CourtReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourtReviewImplFromJson(json);

  @override
  final String id;
  @override
  final String courtId;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String? userAvatarUrl;
  @override
  final double rating;
  @override
  final String? comment;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CourtReview(id: $id, courtId: $courtId, userId: $userId, userName: $userName, userAvatarUrl: $userAvatarUrl, rating: $rating, comment: $comment, imageUrls: $imageUrls, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourtReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courtId, courtId) || other.courtId == courtId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userAvatarUrl, userAvatarUrl) ||
                other.userAvatarUrl == userAvatarUrl) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      courtId,
      userId,
      userName,
      userAvatarUrl,
      rating,
      comment,
      const DeepCollectionEquality().hash(_imageUrls),
      createdAt,
      updatedAt);

  /// Create a copy of CourtReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourtReviewImplCopyWith<_$CourtReviewImpl> get copyWith =>
      __$$CourtReviewImplCopyWithImpl<_$CourtReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourtReviewImplToJson(
      this,
    );
  }
}

abstract class _CourtReview implements CourtReview {
  const factory _CourtReview(
      {required final String id,
      required final String courtId,
      required final String userId,
      required final String userName,
      final String? userAvatarUrl,
      required final double rating,
      final String? comment,
      final List<String> imageUrls,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CourtReviewImpl;

  factory _CourtReview.fromJson(Map<String, dynamic> json) =
      _$CourtReviewImpl.fromJson;

  @override
  String get id;
  @override
  String get courtId;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String? get userAvatarUrl;
  @override
  double get rating;
  @override
  String? get comment;
  @override
  List<String> get imageUrls;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CourtReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourtReviewImplCopyWith<_$CourtReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
