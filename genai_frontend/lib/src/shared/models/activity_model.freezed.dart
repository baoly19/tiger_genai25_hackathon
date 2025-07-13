// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) {
  return _ActivityModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // booking, group, event, court_review, achievement, etc.
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get entityId =>
      throw _privateConstructorUsedError; // court_id, group_id, event_id, etc.
  String? get entityType =>
      throw _privateConstructorUsedError; // court, group, event, etc.
  String? get entityName =>
      throw _privateConstructorUsedError; // name of court, group, event
  String? get location => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata =>
      throw _privateConstructorUsedError; // additional data specific to activity type
  String get priority =>
      throw _privateConstructorUsedError; // normal, high, important
  DateTime? get actionDate =>
      throw _privateConstructorUsedError; // when the actual activity happened (different from createdAt)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ActivityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityModelCopyWith<ActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityModelCopyWith<$Res> {
  factory $ActivityModelCopyWith(
          ActivityModel value, $Res Function(ActivityModel) then) =
      _$ActivityModelCopyWithImpl<$Res, ActivityModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String type,
      String title,
      String description,
      String? entityId,
      String? entityType,
      String? entityName,
      String? location,
      String? imageUrl,
      Map<String, dynamic>? metadata,
      String priority,
      DateTime? actionDate,
      DateTime? createdAt});
}

/// @nodoc
class _$ActivityModelCopyWithImpl<$Res, $Val extends ActivityModel>
    implements $ActivityModelCopyWith<$Res> {
  _$ActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? entityId = freezed,
    Object? entityType = freezed,
    Object? entityName = freezed,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? metadata = freezed,
    Object? priority = null,
    Object? actionDate = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      entityType: freezed == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      actionDate: freezed == actionDate
          ? _value.actionDate
          : actionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityModelImplCopyWith<$Res>
    implements $ActivityModelCopyWith<$Res> {
  factory _$$ActivityModelImplCopyWith(
          _$ActivityModelImpl value, $Res Function(_$ActivityModelImpl) then) =
      __$$ActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String type,
      String title,
      String description,
      String? entityId,
      String? entityType,
      String? entityName,
      String? location,
      String? imageUrl,
      Map<String, dynamic>? metadata,
      String priority,
      DateTime? actionDate,
      DateTime? createdAt});
}

/// @nodoc
class __$$ActivityModelImplCopyWithImpl<$Res>
    extends _$ActivityModelCopyWithImpl<$Res, _$ActivityModelImpl>
    implements _$$ActivityModelImplCopyWith<$Res> {
  __$$ActivityModelImplCopyWithImpl(
      _$ActivityModelImpl _value, $Res Function(_$ActivityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? entityId = freezed,
    Object? entityType = freezed,
    Object? entityName = freezed,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? metadata = freezed,
    Object? priority = null,
    Object? actionDate = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ActivityModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      entityType: freezed == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      actionDate: freezed == actionDate
          ? _value.actionDate
          : actionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityModelImpl implements _ActivityModel {
  const _$ActivityModelImpl(
      {required this.id,
      required this.userId,
      required this.type,
      required this.title,
      required this.description,
      this.entityId,
      this.entityType,
      this.entityName,
      this.location,
      this.imageUrl,
      final Map<String, dynamic>? metadata,
      this.priority = 'normal',
      this.actionDate,
      this.createdAt})
      : _metadata = metadata;

  factory _$ActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String type;
// booking, group, event, court_review, achievement, etc.
  @override
  final String title;
  @override
  final String description;
  @override
  final String? entityId;
// court_id, group_id, event_id, etc.
  @override
  final String? entityType;
// court, group, event, etc.
  @override
  final String? entityName;
// name of court, group, event
  @override
  final String? location;
  @override
  final String? imageUrl;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// additional data specific to activity type
  @override
  @JsonKey()
  final String priority;
// normal, high, important
  @override
  final DateTime? actionDate;
// when the actual activity happened (different from createdAt)
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ActivityModel(id: $id, userId: $userId, type: $type, title: $title, description: $description, entityId: $entityId, entityType: $entityType, entityName: $entityName, location: $location, imageUrl: $imageUrl, metadata: $metadata, priority: $priority, actionDate: $actionDate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.actionDate, actionDate) ||
                other.actionDate == actionDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      type,
      title,
      description,
      entityId,
      entityType,
      entityName,
      location,
      imageUrl,
      const DeepCollectionEquality().hash(_metadata),
      priority,
      actionDate,
      createdAt);

  /// Create a copy of ActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityModelImplCopyWith<_$ActivityModelImpl> get copyWith =>
      __$$ActivityModelImplCopyWithImpl<_$ActivityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityModelImplToJson(
      this,
    );
  }
}

abstract class _ActivityModel implements ActivityModel {
  const factory _ActivityModel(
      {required final String id,
      required final String userId,
      required final String type,
      required final String title,
      required final String description,
      final String? entityId,
      final String? entityType,
      final String? entityName,
      final String? location,
      final String? imageUrl,
      final Map<String, dynamic>? metadata,
      final String priority,
      final DateTime? actionDate,
      final DateTime? createdAt}) = _$ActivityModelImpl;

  factory _ActivityModel.fromJson(Map<String, dynamic> json) =
      _$ActivityModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get type; // booking, group, event, court_review, achievement, etc.
  @override
  String get title;
  @override
  String get description;
  @override
  String? get entityId; // court_id, group_id, event_id, etc.
  @override
  String? get entityType; // court, group, event, etc.
  @override
  String? get entityName; // name of court, group, event
  @override
  String? get location;
  @override
  String? get imageUrl;
  @override
  Map<String, dynamic>?
      get metadata; // additional data specific to activity type
  @override
  String get priority; // normal, high, important
  @override
  DateTime?
      get actionDate; // when the actual activity happened (different from createdAt)
  @override
  DateTime? get createdAt;

  /// Create a copy of ActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityModelImplCopyWith<_$ActivityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivitySummary _$ActivitySummaryFromJson(Map<String, dynamic> json) {
  return _ActivitySummary.fromJson(json);
}

/// @nodoc
mixin _$ActivitySummary {
  int get totalActivities => throw _privateConstructorUsedError;
  int get thisWeekActivities => throw _privateConstructorUsedError;
  int get thisMonthActivities => throw _privateConstructorUsedError;
  int get bookingsCount => throw _privateConstructorUsedError;
  int get groupsJoined => throw _privateConstructorUsedError;
  int get eventsAttended => throw _privateConstructorUsedError;
  int get courtsReviewed => throw _privateConstructorUsedError;
  List<String> get favoriteActivities => throw _privateConstructorUsedError;
  List<String> get recentLocations => throw _privateConstructorUsedError;
  DateTime? get lastActivity => throw _privateConstructorUsedError;

  /// Serializes this ActivitySummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivitySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivitySummaryCopyWith<ActivitySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivitySummaryCopyWith<$Res> {
  factory $ActivitySummaryCopyWith(
          ActivitySummary value, $Res Function(ActivitySummary) then) =
      _$ActivitySummaryCopyWithImpl<$Res, ActivitySummary>;
  @useResult
  $Res call(
      {int totalActivities,
      int thisWeekActivities,
      int thisMonthActivities,
      int bookingsCount,
      int groupsJoined,
      int eventsAttended,
      int courtsReviewed,
      List<String> favoriteActivities,
      List<String> recentLocations,
      DateTime? lastActivity});
}

/// @nodoc
class _$ActivitySummaryCopyWithImpl<$Res, $Val extends ActivitySummary>
    implements $ActivitySummaryCopyWith<$Res> {
  _$ActivitySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivitySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalActivities = null,
    Object? thisWeekActivities = null,
    Object? thisMonthActivities = null,
    Object? bookingsCount = null,
    Object? groupsJoined = null,
    Object? eventsAttended = null,
    Object? courtsReviewed = null,
    Object? favoriteActivities = null,
    Object? recentLocations = null,
    Object? lastActivity = freezed,
  }) {
    return _then(_value.copyWith(
      totalActivities: null == totalActivities
          ? _value.totalActivities
          : totalActivities // ignore: cast_nullable_to_non_nullable
              as int,
      thisWeekActivities: null == thisWeekActivities
          ? _value.thisWeekActivities
          : thisWeekActivities // ignore: cast_nullable_to_non_nullable
              as int,
      thisMonthActivities: null == thisMonthActivities
          ? _value.thisMonthActivities
          : thisMonthActivities // ignore: cast_nullable_to_non_nullable
              as int,
      bookingsCount: null == bookingsCount
          ? _value.bookingsCount
          : bookingsCount // ignore: cast_nullable_to_non_nullable
              as int,
      groupsJoined: null == groupsJoined
          ? _value.groupsJoined
          : groupsJoined // ignore: cast_nullable_to_non_nullable
              as int,
      eventsAttended: null == eventsAttended
          ? _value.eventsAttended
          : eventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      courtsReviewed: null == courtsReviewed
          ? _value.courtsReviewed
          : courtsReviewed // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteActivities: null == favoriteActivities
          ? _value.favoriteActivities
          : favoriteActivities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recentLocations: null == recentLocations
          ? _value.recentLocations
          : recentLocations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastActivity: freezed == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivitySummaryImplCopyWith<$Res>
    implements $ActivitySummaryCopyWith<$Res> {
  factory _$$ActivitySummaryImplCopyWith(_$ActivitySummaryImpl value,
          $Res Function(_$ActivitySummaryImpl) then) =
      __$$ActivitySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalActivities,
      int thisWeekActivities,
      int thisMonthActivities,
      int bookingsCount,
      int groupsJoined,
      int eventsAttended,
      int courtsReviewed,
      List<String> favoriteActivities,
      List<String> recentLocations,
      DateTime? lastActivity});
}

/// @nodoc
class __$$ActivitySummaryImplCopyWithImpl<$Res>
    extends _$ActivitySummaryCopyWithImpl<$Res, _$ActivitySummaryImpl>
    implements _$$ActivitySummaryImplCopyWith<$Res> {
  __$$ActivitySummaryImplCopyWithImpl(
      _$ActivitySummaryImpl _value, $Res Function(_$ActivitySummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivitySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalActivities = null,
    Object? thisWeekActivities = null,
    Object? thisMonthActivities = null,
    Object? bookingsCount = null,
    Object? groupsJoined = null,
    Object? eventsAttended = null,
    Object? courtsReviewed = null,
    Object? favoriteActivities = null,
    Object? recentLocations = null,
    Object? lastActivity = freezed,
  }) {
    return _then(_$ActivitySummaryImpl(
      totalActivities: null == totalActivities
          ? _value.totalActivities
          : totalActivities // ignore: cast_nullable_to_non_nullable
              as int,
      thisWeekActivities: null == thisWeekActivities
          ? _value.thisWeekActivities
          : thisWeekActivities // ignore: cast_nullable_to_non_nullable
              as int,
      thisMonthActivities: null == thisMonthActivities
          ? _value.thisMonthActivities
          : thisMonthActivities // ignore: cast_nullable_to_non_nullable
              as int,
      bookingsCount: null == bookingsCount
          ? _value.bookingsCount
          : bookingsCount // ignore: cast_nullable_to_non_nullable
              as int,
      groupsJoined: null == groupsJoined
          ? _value.groupsJoined
          : groupsJoined // ignore: cast_nullable_to_non_nullable
              as int,
      eventsAttended: null == eventsAttended
          ? _value.eventsAttended
          : eventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      courtsReviewed: null == courtsReviewed
          ? _value.courtsReviewed
          : courtsReviewed // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteActivities: null == favoriteActivities
          ? _value._favoriteActivities
          : favoriteActivities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recentLocations: null == recentLocations
          ? _value._recentLocations
          : recentLocations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastActivity: freezed == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivitySummaryImpl implements _ActivitySummary {
  const _$ActivitySummaryImpl(
      {this.totalActivities = 0,
      this.thisWeekActivities = 0,
      this.thisMonthActivities = 0,
      this.bookingsCount = 0,
      this.groupsJoined = 0,
      this.eventsAttended = 0,
      this.courtsReviewed = 0,
      final List<String> favoriteActivities = const [],
      final List<String> recentLocations = const [],
      this.lastActivity})
      : _favoriteActivities = favoriteActivities,
        _recentLocations = recentLocations;

  factory _$ActivitySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivitySummaryImplFromJson(json);

  @override
  @JsonKey()
  final int totalActivities;
  @override
  @JsonKey()
  final int thisWeekActivities;
  @override
  @JsonKey()
  final int thisMonthActivities;
  @override
  @JsonKey()
  final int bookingsCount;
  @override
  @JsonKey()
  final int groupsJoined;
  @override
  @JsonKey()
  final int eventsAttended;
  @override
  @JsonKey()
  final int courtsReviewed;
  final List<String> _favoriteActivities;
  @override
  @JsonKey()
  List<String> get favoriteActivities {
    if (_favoriteActivities is EqualUnmodifiableListView)
      return _favoriteActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteActivities);
  }

  final List<String> _recentLocations;
  @override
  @JsonKey()
  List<String> get recentLocations {
    if (_recentLocations is EqualUnmodifiableListView) return _recentLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentLocations);
  }

  @override
  final DateTime? lastActivity;

  @override
  String toString() {
    return 'ActivitySummary(totalActivities: $totalActivities, thisWeekActivities: $thisWeekActivities, thisMonthActivities: $thisMonthActivities, bookingsCount: $bookingsCount, groupsJoined: $groupsJoined, eventsAttended: $eventsAttended, courtsReviewed: $courtsReviewed, favoriteActivities: $favoriteActivities, recentLocations: $recentLocations, lastActivity: $lastActivity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivitySummaryImpl &&
            (identical(other.totalActivities, totalActivities) ||
                other.totalActivities == totalActivities) &&
            (identical(other.thisWeekActivities, thisWeekActivities) ||
                other.thisWeekActivities == thisWeekActivities) &&
            (identical(other.thisMonthActivities, thisMonthActivities) ||
                other.thisMonthActivities == thisMonthActivities) &&
            (identical(other.bookingsCount, bookingsCount) ||
                other.bookingsCount == bookingsCount) &&
            (identical(other.groupsJoined, groupsJoined) ||
                other.groupsJoined == groupsJoined) &&
            (identical(other.eventsAttended, eventsAttended) ||
                other.eventsAttended == eventsAttended) &&
            (identical(other.courtsReviewed, courtsReviewed) ||
                other.courtsReviewed == courtsReviewed) &&
            const DeepCollectionEquality()
                .equals(other._favoriteActivities, _favoriteActivities) &&
            const DeepCollectionEquality()
                .equals(other._recentLocations, _recentLocations) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalActivities,
      thisWeekActivities,
      thisMonthActivities,
      bookingsCount,
      groupsJoined,
      eventsAttended,
      courtsReviewed,
      const DeepCollectionEquality().hash(_favoriteActivities),
      const DeepCollectionEquality().hash(_recentLocations),
      lastActivity);

  /// Create a copy of ActivitySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivitySummaryImplCopyWith<_$ActivitySummaryImpl> get copyWith =>
      __$$ActivitySummaryImplCopyWithImpl<_$ActivitySummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivitySummaryImplToJson(
      this,
    );
  }
}

abstract class _ActivitySummary implements ActivitySummary {
  const factory _ActivitySummary(
      {final int totalActivities,
      final int thisWeekActivities,
      final int thisMonthActivities,
      final int bookingsCount,
      final int groupsJoined,
      final int eventsAttended,
      final int courtsReviewed,
      final List<String> favoriteActivities,
      final List<String> recentLocations,
      final DateTime? lastActivity}) = _$ActivitySummaryImpl;

  factory _ActivitySummary.fromJson(Map<String, dynamic> json) =
      _$ActivitySummaryImpl.fromJson;

  @override
  int get totalActivities;
  @override
  int get thisWeekActivities;
  @override
  int get thisMonthActivities;
  @override
  int get bookingsCount;
  @override
  int get groupsJoined;
  @override
  int get eventsAttended;
  @override
  int get courtsReviewed;
  @override
  List<String> get favoriteActivities;
  @override
  List<String> get recentLocations;
  @override
  DateTime? get lastActivity;

  /// Create a copy of ActivitySummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivitySummaryImplCopyWith<_$ActivitySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
