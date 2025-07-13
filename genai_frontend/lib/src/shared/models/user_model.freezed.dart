// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String get skillLevel =>
      throw _privateConstructorUsedError; // beginner, intermediate, advanced, expert
  Map<String, dynamic>? get preferences => throw _privateConstructorUsedError;
  List<String> get favoriteGroups => throw _privateConstructorUsedError;
  List<String> get recentBookings => throw _privateConstructorUsedError;
  DateTime? get lastActiveAt => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String email,
      String name,
      String? avatarUrl,
      String? location,
      int? age,
      String skillLevel,
      Map<String, dynamic>? preferences,
      List<String> favoriteGroups,
      List<String> recentBookings,
      DateTime? lastActiveAt,
      bool isVerified,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? location = freezed,
    Object? age = freezed,
    Object? skillLevel = null,
    Object? preferences = freezed,
    Object? favoriteGroups = null,
    Object? recentBookings = null,
    Object? lastActiveAt = freezed,
    Object? isVerified = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      skillLevel: null == skillLevel
          ? _value.skillLevel
          : skillLevel // ignore: cast_nullable_to_non_nullable
              as String,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      favoriteGroups: null == favoriteGroups
          ? _value.favoriteGroups
          : favoriteGroups // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recentBookings: null == recentBookings
          ? _value.recentBookings
          : recentBookings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String name,
      String? avatarUrl,
      String? location,
      int? age,
      String skillLevel,
      Map<String, dynamic>? preferences,
      List<String> favoriteGroups,
      List<String> recentBookings,
      DateTime? lastActiveAt,
      bool isVerified,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? location = freezed,
    Object? age = freezed,
    Object? skillLevel = null,
    Object? preferences = freezed,
    Object? favoriteGroups = null,
    Object? recentBookings = null,
    Object? lastActiveAt = freezed,
    Object? isVerified = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      skillLevel: null == skillLevel
          ? _value.skillLevel
          : skillLevel // ignore: cast_nullable_to_non_nullable
              as String,
      preferences: freezed == preferences
          ? _value._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      favoriteGroups: null == favoriteGroups
          ? _value._favoriteGroups
          : favoriteGroups // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recentBookings: null == recentBookings
          ? _value._recentBookings
          : recentBookings // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.email,
      required this.name,
      this.avatarUrl,
      this.location,
      this.age,
      this.skillLevel = 'beginner',
      final Map<String, dynamic>? preferences,
      final List<String> favoriteGroups = const [],
      final List<String> recentBookings = const [],
      this.lastActiveAt,
      this.isVerified = false,
      this.createdAt,
      this.updatedAt})
      : _preferences = preferences,
        _favoriteGroups = favoriteGroups,
        _recentBookings = recentBookings;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String? avatarUrl;
  @override
  final String? location;
  @override
  final int? age;
  @override
  @JsonKey()
  final String skillLevel;
// beginner, intermediate, advanced, expert
  final Map<String, dynamic>? _preferences;
// beginner, intermediate, advanced, expert
  @override
  Map<String, dynamic>? get preferences {
    final value = _preferences;
    if (value == null) return null;
    if (_preferences is EqualUnmodifiableMapView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String> _favoriteGroups;
  @override
  @JsonKey()
  List<String> get favoriteGroups {
    if (_favoriteGroups is EqualUnmodifiableListView) return _favoriteGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteGroups);
  }

  final List<String> _recentBookings;
  @override
  @JsonKey()
  List<String> get recentBookings {
    if (_recentBookings is EqualUnmodifiableListView) return _recentBookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentBookings);
  }

  @override
  final DateTime? lastActiveAt;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, avatarUrl: $avatarUrl, location: $location, age: $age, skillLevel: $skillLevel, preferences: $preferences, favoriteGroups: $favoriteGroups, recentBookings: $recentBookings, lastActiveAt: $lastActiveAt, isVerified: $isVerified, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.skillLevel, skillLevel) ||
                other.skillLevel == skillLevel) &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences) &&
            const DeepCollectionEquality()
                .equals(other._favoriteGroups, _favoriteGroups) &&
            const DeepCollectionEquality()
                .equals(other._recentBookings, _recentBookings) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
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
      email,
      name,
      avatarUrl,
      location,
      age,
      skillLevel,
      const DeepCollectionEquality().hash(_preferences),
      const DeepCollectionEquality().hash(_favoriteGroups),
      const DeepCollectionEquality().hash(_recentBookings),
      lastActiveAt,
      isVerified,
      createdAt,
      updatedAt);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String id,
      required final String email,
      required final String name,
      final String? avatarUrl,
      final String? location,
      final int? age,
      final String skillLevel,
      final Map<String, dynamic>? preferences,
      final List<String> favoriteGroups,
      final List<String> recentBookings,
      final DateTime? lastActiveAt,
      final bool isVerified,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String? get avatarUrl;
  @override
  String? get location;
  @override
  int? get age;
  @override
  String get skillLevel; // beginner, intermediate, advanced, expert
  @override
  Map<String, dynamic>? get preferences;
  @override
  List<String> get favoriteGroups;
  @override
  List<String> get recentBookings;
  @override
  DateTime? get lastActiveAt;
  @override
  bool get isVerified;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  List<String> get sportTypes =>
      throw _privateConstructorUsedError; // tennis, basketball, badminton, etc.
  String get preferredTimeSlot =>
      throw _privateConstructorUsedError; // morning, afternoon, evening, any
  double? get maxDistance => throw _privateConstructorUsedError; // in km
  String get preferredLevel =>
      throw _privateConstructorUsedError; // same_level, any_level, below_level
  bool get allowNotifications => throw _privateConstructorUsedError;
  bool get allowGroupInvites => throw _privateConstructorUsedError;
  bool get isPrivateProfile => throw _privateConstructorUsedError;

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {List<String> sportTypes,
      String preferredTimeSlot,
      double? maxDistance,
      String preferredLevel,
      bool allowNotifications,
      bool allowGroupInvites,
      bool isPrivateProfile});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sportTypes = null,
    Object? preferredTimeSlot = null,
    Object? maxDistance = freezed,
    Object? preferredLevel = null,
    Object? allowNotifications = null,
    Object? allowGroupInvites = null,
    Object? isPrivateProfile = null,
  }) {
    return _then(_value.copyWith(
      sportTypes: null == sportTypes
          ? _value.sportTypes
          : sportTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredTimeSlot: null == preferredTimeSlot
          ? _value.preferredTimeSlot
          : preferredTimeSlot // ignore: cast_nullable_to_non_nullable
              as String,
      maxDistance: freezed == maxDistance
          ? _value.maxDistance
          : maxDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      preferredLevel: null == preferredLevel
          ? _value.preferredLevel
          : preferredLevel // ignore: cast_nullable_to_non_nullable
              as String,
      allowNotifications: null == allowNotifications
          ? _value.allowNotifications
          : allowNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      allowGroupInvites: null == allowGroupInvites
          ? _value.allowGroupInvites
          : allowGroupInvites // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivateProfile: null == isPrivateProfile
          ? _value.isPrivateProfile
          : isPrivateProfile // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> sportTypes,
      String preferredTimeSlot,
      double? maxDistance,
      String preferredLevel,
      bool allowNotifications,
      bool allowGroupInvites,
      bool isPrivateProfile});
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sportTypes = null,
    Object? preferredTimeSlot = null,
    Object? maxDistance = freezed,
    Object? preferredLevel = null,
    Object? allowNotifications = null,
    Object? allowGroupInvites = null,
    Object? isPrivateProfile = null,
  }) {
    return _then(_$UserPreferencesImpl(
      sportTypes: null == sportTypes
          ? _value._sportTypes
          : sportTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredTimeSlot: null == preferredTimeSlot
          ? _value.preferredTimeSlot
          : preferredTimeSlot // ignore: cast_nullable_to_non_nullable
              as String,
      maxDistance: freezed == maxDistance
          ? _value.maxDistance
          : maxDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      preferredLevel: null == preferredLevel
          ? _value.preferredLevel
          : preferredLevel // ignore: cast_nullable_to_non_nullable
              as String,
      allowNotifications: null == allowNotifications
          ? _value.allowNotifications
          : allowNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      allowGroupInvites: null == allowGroupInvites
          ? _value.allowGroupInvites
          : allowGroupInvites // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrivateProfile: null == isPrivateProfile
          ? _value.isPrivateProfile
          : isPrivateProfile // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl(
      {final List<String> sportTypes = const [],
      this.preferredTimeSlot = 'any',
      this.maxDistance,
      this.preferredLevel = 'any',
      this.allowNotifications = true,
      this.allowGroupInvites = true,
      this.isPrivateProfile = false})
      : _sportTypes = sportTypes;

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

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
  @JsonKey()
  final String preferredTimeSlot;
// morning, afternoon, evening, any
  @override
  final double? maxDistance;
// in km
  @override
  @JsonKey()
  final String preferredLevel;
// same_level, any_level, below_level
  @override
  @JsonKey()
  final bool allowNotifications;
  @override
  @JsonKey()
  final bool allowGroupInvites;
  @override
  @JsonKey()
  final bool isPrivateProfile;

  @override
  String toString() {
    return 'UserPreferences(sportTypes: $sportTypes, preferredTimeSlot: $preferredTimeSlot, maxDistance: $maxDistance, preferredLevel: $preferredLevel, allowNotifications: $allowNotifications, allowGroupInvites: $allowGroupInvites, isPrivateProfile: $isPrivateProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            const DeepCollectionEquality()
                .equals(other._sportTypes, _sportTypes) &&
            (identical(other.preferredTimeSlot, preferredTimeSlot) ||
                other.preferredTimeSlot == preferredTimeSlot) &&
            (identical(other.maxDistance, maxDistance) ||
                other.maxDistance == maxDistance) &&
            (identical(other.preferredLevel, preferredLevel) ||
                other.preferredLevel == preferredLevel) &&
            (identical(other.allowNotifications, allowNotifications) ||
                other.allowNotifications == allowNotifications) &&
            (identical(other.allowGroupInvites, allowGroupInvites) ||
                other.allowGroupInvites == allowGroupInvites) &&
            (identical(other.isPrivateProfile, isPrivateProfile) ||
                other.isPrivateProfile == isPrivateProfile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sportTypes),
      preferredTimeSlot,
      maxDistance,
      preferredLevel,
      allowNotifications,
      allowGroupInvites,
      isPrivateProfile);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {final List<String> sportTypes,
      final String preferredTimeSlot,
      final double? maxDistance,
      final String preferredLevel,
      final bool allowNotifications,
      final bool allowGroupInvites,
      final bool isPrivateProfile}) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  List<String> get sportTypes; // tennis, basketball, badminton, etc.
  @override
  String get preferredTimeSlot; // morning, afternoon, evening, any
  @override
  double? get maxDistance; // in km
  @override
  String get preferredLevel; // same_level, any_level, below_level
  @override
  bool get allowNotifications;
  @override
  bool get allowGroupInvites;
  @override
  bool get isPrivateProfile;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
