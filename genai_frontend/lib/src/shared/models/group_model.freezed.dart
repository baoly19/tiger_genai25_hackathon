// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) {
  return _GroupModel.fromJson(json);
}

/// @nodoc
mixin _$GroupModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String get privacy =>
      throw _privateConstructorUsedError; // public, private, invite_only
  List<String> get sportTypes => throw _privateConstructorUsedError;
  List<GroupMember> get members => throw _privateConstructorUsedError;
  int get maxMembers => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  Map<String, dynamic> get settings => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this GroupModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupModelCopyWith<GroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupModelCopyWith<$Res> {
  factory $GroupModelCopyWith(
          GroupModel value, $Res Function(GroupModel) then) =
      _$GroupModelCopyWithImpl<$Res, GroupModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String ownerId,
      String? avatarUrl,
      String privacy,
      List<String> sportTypes,
      List<GroupMember> members,
      int maxMembers,
      String? location,
      Map<String, dynamic> settings,
      List<String> tags,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$GroupModelCopyWithImpl<$Res, $Val extends GroupModel>
    implements $GroupModelCopyWith<$Res> {
  _$GroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? ownerId = null,
    Object? avatarUrl = freezed,
    Object? privacy = null,
    Object? sportTypes = null,
    Object? members = null,
    Object? maxMembers = null,
    Object? location = freezed,
    Object? settings = null,
    Object? tags = null,
    Object? isActive = null,
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
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as String,
      sportTypes: null == sportTypes
          ? _value.sportTypes
          : sportTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<GroupMember>,
      maxMembers: null == maxMembers
          ? _value.maxMembers
          : maxMembers // ignore: cast_nullable_to_non_nullable
              as int,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
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
abstract class _$$GroupModelImplCopyWith<$Res>
    implements $GroupModelCopyWith<$Res> {
  factory _$$GroupModelImplCopyWith(
          _$GroupModelImpl value, $Res Function(_$GroupModelImpl) then) =
      __$$GroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String ownerId,
      String? avatarUrl,
      String privacy,
      List<String> sportTypes,
      List<GroupMember> members,
      int maxMembers,
      String? location,
      Map<String, dynamic> settings,
      List<String> tags,
      bool isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$GroupModelImplCopyWithImpl<$Res>
    extends _$GroupModelCopyWithImpl<$Res, _$GroupModelImpl>
    implements _$$GroupModelImplCopyWith<$Res> {
  __$$GroupModelImplCopyWithImpl(
      _$GroupModelImpl _value, $Res Function(_$GroupModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? ownerId = null,
    Object? avatarUrl = freezed,
    Object? privacy = null,
    Object? sportTypes = null,
    Object? members = null,
    Object? maxMembers = null,
    Object? location = freezed,
    Object? settings = null,
    Object? tags = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$GroupModelImpl(
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
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as String,
      sportTypes: null == sportTypes
          ? _value._sportTypes
          : sportTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<GroupMember>,
      maxMembers: null == maxMembers
          ? _value.maxMembers
          : maxMembers // ignore: cast_nullable_to_non_nullable
              as int,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: null == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
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
class _$GroupModelImpl implements _GroupModel {
  const _$GroupModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.ownerId,
      this.avatarUrl,
      this.privacy = 'public',
      final List<String> sportTypes = const [],
      final List<GroupMember> members = const [],
      this.maxMembers = 0,
      this.location,
      final Map<String, dynamic> settings = const {},
      final List<String> tags = const [],
      this.isActive = true,
      this.createdAt,
      this.updatedAt})
      : _sportTypes = sportTypes,
        _members = members,
        _settings = settings,
        _tags = tags;

  factory _$GroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String ownerId;
  @override
  final String? avatarUrl;
  @override
  @JsonKey()
  final String privacy;
// public, private, invite_only
  final List<String> _sportTypes;
// public, private, invite_only
  @override
  @JsonKey()
  List<String> get sportTypes {
    if (_sportTypes is EqualUnmodifiableListView) return _sportTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sportTypes);
  }

  final List<GroupMember> _members;
  @override
  @JsonKey()
  List<GroupMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @JsonKey()
  final int maxMembers;
  @override
  final String? location;
  final Map<String, dynamic> _settings;
  @override
  @JsonKey()
  Map<String, dynamic> get settings {
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_settings);
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
  @JsonKey()
  final bool isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'GroupModel(id: $id, name: $name, description: $description, ownerId: $ownerId, avatarUrl: $avatarUrl, privacy: $privacy, sportTypes: $sportTypes, members: $members, maxMembers: $maxMembers, location: $location, settings: $settings, tags: $tags, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            const DeepCollectionEquality()
                .equals(other._sportTypes, _sportTypes) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.maxMembers, maxMembers) ||
                other.maxMembers == maxMembers) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._settings, _settings) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
      ownerId,
      avatarUrl,
      privacy,
      const DeepCollectionEquality().hash(_sportTypes),
      const DeepCollectionEquality().hash(_members),
      maxMembers,
      location,
      const DeepCollectionEquality().hash(_settings),
      const DeepCollectionEquality().hash(_tags),
      isActive,
      createdAt,
      updatedAt);

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupModelImplCopyWith<_$GroupModelImpl> get copyWith =>
      __$$GroupModelImplCopyWithImpl<_$GroupModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupModelImplToJson(
      this,
    );
  }
}

abstract class _GroupModel implements GroupModel {
  const factory _GroupModel(
      {required final String id,
      required final String name,
      required final String description,
      required final String ownerId,
      final String? avatarUrl,
      final String privacy,
      final List<String> sportTypes,
      final List<GroupMember> members,
      final int maxMembers,
      final String? location,
      final Map<String, dynamic> settings,
      final List<String> tags,
      final bool isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$GroupModelImpl;

  factory _GroupModel.fromJson(Map<String, dynamic> json) =
      _$GroupModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get ownerId;
  @override
  String? get avatarUrl;
  @override
  String get privacy; // public, private, invite_only
  @override
  List<String> get sportTypes;
  @override
  List<GroupMember> get members;
  @override
  int get maxMembers;
  @override
  String? get location;
  @override
  Map<String, dynamic> get settings;
  @override
  List<String> get tags;
  @override
  bool get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of GroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupModelImplCopyWith<_$GroupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupMember _$GroupMemberFromJson(Map<String, dynamic> json) {
  return _GroupMember.fromJson(json);
}

/// @nodoc
mixin _$GroupMember {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get userAvatarUrl => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError; // owner, admin, member
  DateTime? get joinedAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get skillLevel => throw _privateConstructorUsedError;

  /// Serializes this GroupMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupMemberCopyWith<GroupMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupMemberCopyWith<$Res> {
  factory $GroupMemberCopyWith(
          GroupMember value, $Res Function(GroupMember) then) =
      _$GroupMemberCopyWithImpl<$Res, GroupMember>;
  @useResult
  $Res call(
      {String userId,
      String userName,
      String? userAvatarUrl,
      String role,
      DateTime? joinedAt,
      bool isActive,
      String? skillLevel});
}

/// @nodoc
class _$GroupMemberCopyWithImpl<$Res, $Val extends GroupMember>
    implements $GroupMemberCopyWith<$Res> {
  _$GroupMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? userAvatarUrl = freezed,
    Object? role = null,
    Object? joinedAt = freezed,
    Object? isActive = null,
    Object? skillLevel = freezed,
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
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      skillLevel: freezed == skillLevel
          ? _value.skillLevel
          : skillLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupMemberImplCopyWith<$Res>
    implements $GroupMemberCopyWith<$Res> {
  factory _$$GroupMemberImplCopyWith(
          _$GroupMemberImpl value, $Res Function(_$GroupMemberImpl) then) =
      __$$GroupMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String userName,
      String? userAvatarUrl,
      String role,
      DateTime? joinedAt,
      bool isActive,
      String? skillLevel});
}

/// @nodoc
class __$$GroupMemberImplCopyWithImpl<$Res>
    extends _$GroupMemberCopyWithImpl<$Res, _$GroupMemberImpl>
    implements _$$GroupMemberImplCopyWith<$Res> {
  __$$GroupMemberImplCopyWithImpl(
      _$GroupMemberImpl _value, $Res Function(_$GroupMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? userAvatarUrl = freezed,
    Object? role = null,
    Object? joinedAt = freezed,
    Object? isActive = null,
    Object? skillLevel = freezed,
  }) {
    return _then(_$GroupMemberImpl(
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
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      skillLevel: freezed == skillLevel
          ? _value.skillLevel
          : skillLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupMemberImpl implements _GroupMember {
  const _$GroupMemberImpl(
      {required this.userId,
      required this.userName,
      this.userAvatarUrl,
      this.role = 'member',
      this.joinedAt,
      this.isActive = true,
      this.skillLevel});

  factory _$GroupMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupMemberImplFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String? userAvatarUrl;
  @override
  @JsonKey()
  final String role;
// owner, admin, member
  @override
  final DateTime? joinedAt;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final String? skillLevel;

  @override
  String toString() {
    return 'GroupMember(userId: $userId, userName: $userName, userAvatarUrl: $userAvatarUrl, role: $role, joinedAt: $joinedAt, isActive: $isActive, skillLevel: $skillLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupMemberImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userAvatarUrl, userAvatarUrl) ||
                other.userAvatarUrl == userAvatarUrl) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.skillLevel, skillLevel) ||
                other.skillLevel == skillLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, userAvatarUrl,
      role, joinedAt, isActive, skillLevel);

  /// Create a copy of GroupMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupMemberImplCopyWith<_$GroupMemberImpl> get copyWith =>
      __$$GroupMemberImplCopyWithImpl<_$GroupMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupMemberImplToJson(
      this,
    );
  }
}

abstract class _GroupMember implements GroupMember {
  const factory _GroupMember(
      {required final String userId,
      required final String userName,
      final String? userAvatarUrl,
      final String role,
      final DateTime? joinedAt,
      final bool isActive,
      final String? skillLevel}) = _$GroupMemberImpl;

  factory _GroupMember.fromJson(Map<String, dynamic> json) =
      _$GroupMemberImpl.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String? get userAvatarUrl;
  @override
  String get role; // owner, admin, member
  @override
  DateTime? get joinedAt;
  @override
  bool get isActive;
  @override
  String? get skillLevel;

  /// Create a copy of GroupMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupMemberImplCopyWith<_$GroupMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupMessage _$GroupMessageFromJson(Map<String, dynamic> json) {
  return _GroupMessage.fromJson(json);
}

/// @nodoc
mixin _$GroupMessage {
  String get id => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String? get senderAvatarUrl => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get messageType =>
      throw _privateConstructorUsedError; // text, image, booking, event
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool get isEdited => throw _privateConstructorUsedError;
  DateTime? get editedAt => throw _privateConstructorUsedError;

  /// Serializes this GroupMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupMessageCopyWith<GroupMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupMessageCopyWith<$Res> {
  factory $GroupMessageCopyWith(
          GroupMessage value, $Res Function(GroupMessage) then) =
      _$GroupMessageCopyWithImpl<$Res, GroupMessage>;
  @useResult
  $Res call(
      {String id,
      String groupId,
      String senderId,
      String senderName,
      String? senderAvatarUrl,
      String content,
      String messageType,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      bool isEdited,
      DateTime? editedAt});
}

/// @nodoc
class _$GroupMessageCopyWithImpl<$Res, $Val extends GroupMessage>
    implements $GroupMessageCopyWith<$Res> {
  _$GroupMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatarUrl = freezed,
    Object? content = null,
    Object? messageType = null,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? isEdited = null,
    Object? editedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderAvatarUrl: freezed == senderAvatarUrl
          ? _value.senderAvatarUrl
          : senderAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isEdited: null == isEdited
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      editedAt: freezed == editedAt
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupMessageImplCopyWith<$Res>
    implements $GroupMessageCopyWith<$Res> {
  factory _$$GroupMessageImplCopyWith(
          _$GroupMessageImpl value, $Res Function(_$GroupMessageImpl) then) =
      __$$GroupMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String groupId,
      String senderId,
      String senderName,
      String? senderAvatarUrl,
      String content,
      String messageType,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      bool isEdited,
      DateTime? editedAt});
}

/// @nodoc
class __$$GroupMessageImplCopyWithImpl<$Res>
    extends _$GroupMessageCopyWithImpl<$Res, _$GroupMessageImpl>
    implements _$$GroupMessageImplCopyWith<$Res> {
  __$$GroupMessageImplCopyWithImpl(
      _$GroupMessageImpl _value, $Res Function(_$GroupMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatarUrl = freezed,
    Object? content = null,
    Object? messageType = null,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? isEdited = null,
    Object? editedAt = freezed,
  }) {
    return _then(_$GroupMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderAvatarUrl: freezed == senderAvatarUrl
          ? _value.senderAvatarUrl
          : senderAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isEdited: null == isEdited
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      editedAt: freezed == editedAt
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupMessageImpl implements _GroupMessage {
  const _$GroupMessageImpl(
      {required this.id,
      required this.groupId,
      required this.senderId,
      required this.senderName,
      this.senderAvatarUrl,
      required this.content,
      this.messageType = 'text',
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.isEdited = false,
      this.editedAt})
      : _metadata = metadata;

  factory _$GroupMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String groupId;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatarUrl;
  @override
  final String content;
  @override
  @JsonKey()
  final String messageType;
// text, image, booking, event
  final Map<String, dynamic>? _metadata;
// text, image, booking, event
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  @JsonKey()
  final bool isEdited;
  @override
  final DateTime? editedAt;

  @override
  String toString() {
    return 'GroupMessage(id: $id, groupId: $groupId, senderId: $senderId, senderName: $senderName, senderAvatarUrl: $senderAvatarUrl, content: $content, messageType: $messageType, metadata: $metadata, createdAt: $createdAt, isEdited: $isEdited, editedAt: $editedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatarUrl, senderAvatarUrl) ||
                other.senderAvatarUrl == senderAvatarUrl) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited) &&
            (identical(other.editedAt, editedAt) ||
                other.editedAt == editedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      groupId,
      senderId,
      senderName,
      senderAvatarUrl,
      content,
      messageType,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      isEdited,
      editedAt);

  /// Create a copy of GroupMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupMessageImplCopyWith<_$GroupMessageImpl> get copyWith =>
      __$$GroupMessageImplCopyWithImpl<_$GroupMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupMessageImplToJson(
      this,
    );
  }
}

abstract class _GroupMessage implements GroupMessage {
  const factory _GroupMessage(
      {required final String id,
      required final String groupId,
      required final String senderId,
      required final String senderName,
      final String? senderAvatarUrl,
      required final String content,
      final String messageType,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt,
      final bool isEdited,
      final DateTime? editedAt}) = _$GroupMessageImpl;

  factory _GroupMessage.fromJson(Map<String, dynamic> json) =
      _$GroupMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get groupId;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatarUrl;
  @override
  String get content;
  @override
  String get messageType; // text, image, booking, event
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  bool get isEdited;
  @override
  DateTime? get editedAt;

  /// Create a copy of GroupMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupMessageImplCopyWith<_$GroupMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupInvite _$GroupInviteFromJson(Map<String, dynamic> json) {
  return _GroupInvite.fromJson(json);
}

/// @nodoc
mixin _$GroupInvite {
  String get id => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  String get groupName => throw _privateConstructorUsedError;
  String get inviterId => throw _privateConstructorUsedError;
  String get inviterName => throw _privateConstructorUsedError;
  String get inviteeId => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // pending, accepted, declined, expired
  String? get message => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  DateTime? get respondedAt => throw _privateConstructorUsedError;

  /// Serializes this GroupInvite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupInviteCopyWith<GroupInvite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupInviteCopyWith<$Res> {
  factory $GroupInviteCopyWith(
          GroupInvite value, $Res Function(GroupInvite) then) =
      _$GroupInviteCopyWithImpl<$Res, GroupInvite>;
  @useResult
  $Res call(
      {String id,
      String groupId,
      String groupName,
      String inviterId,
      String inviterName,
      String inviteeId,
      String status,
      String? message,
      DateTime? createdAt,
      DateTime? expiresAt,
      DateTime? respondedAt});
}

/// @nodoc
class _$GroupInviteCopyWithImpl<$Res, $Val extends GroupInvite>
    implements $GroupInviteCopyWith<$Res> {
  _$GroupInviteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupInvite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? groupName = null,
    Object? inviterId = null,
    Object? inviterName = null,
    Object? inviteeId = null,
    Object? status = null,
    Object? message = freezed,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? respondedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      inviterId: null == inviterId
          ? _value.inviterId
          : inviterId // ignore: cast_nullable_to_non_nullable
              as String,
      inviterName: null == inviterName
          ? _value.inviterName
          : inviterName // ignore: cast_nullable_to_non_nullable
              as String,
      inviteeId: null == inviteeId
          ? _value.inviteeId
          : inviteeId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupInviteImplCopyWith<$Res>
    implements $GroupInviteCopyWith<$Res> {
  factory _$$GroupInviteImplCopyWith(
          _$GroupInviteImpl value, $Res Function(_$GroupInviteImpl) then) =
      __$$GroupInviteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String groupId,
      String groupName,
      String inviterId,
      String inviterName,
      String inviteeId,
      String status,
      String? message,
      DateTime? createdAt,
      DateTime? expiresAt,
      DateTime? respondedAt});
}

/// @nodoc
class __$$GroupInviteImplCopyWithImpl<$Res>
    extends _$GroupInviteCopyWithImpl<$Res, _$GroupInviteImpl>
    implements _$$GroupInviteImplCopyWith<$Res> {
  __$$GroupInviteImplCopyWithImpl(
      _$GroupInviteImpl _value, $Res Function(_$GroupInviteImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupInvite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? groupName = null,
    Object? inviterId = null,
    Object? inviterName = null,
    Object? inviteeId = null,
    Object? status = null,
    Object? message = freezed,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? respondedAt = freezed,
  }) {
    return _then(_$GroupInviteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      inviterId: null == inviterId
          ? _value.inviterId
          : inviterId // ignore: cast_nullable_to_non_nullable
              as String,
      inviterName: null == inviterName
          ? _value.inviterName
          : inviterName // ignore: cast_nullable_to_non_nullable
              as String,
      inviteeId: null == inviteeId
          ? _value.inviteeId
          : inviteeId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupInviteImpl implements _GroupInvite {
  const _$GroupInviteImpl(
      {required this.id,
      required this.groupId,
      required this.groupName,
      required this.inviterId,
      required this.inviterName,
      required this.inviteeId,
      this.status = 'pending',
      this.message,
      this.createdAt,
      this.expiresAt,
      this.respondedAt});

  factory _$GroupInviteImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupInviteImplFromJson(json);

  @override
  final String id;
  @override
  final String groupId;
  @override
  final String groupName;
  @override
  final String inviterId;
  @override
  final String inviterName;
  @override
  final String inviteeId;
  @override
  @JsonKey()
  final String status;
// pending, accepted, declined, expired
  @override
  final String? message;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? expiresAt;
  @override
  final DateTime? respondedAt;

  @override
  String toString() {
    return 'GroupInvite(id: $id, groupId: $groupId, groupName: $groupName, inviterId: $inviterId, inviterName: $inviterName, inviteeId: $inviteeId, status: $status, message: $message, createdAt: $createdAt, expiresAt: $expiresAt, respondedAt: $respondedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupInviteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.inviterId, inviterId) ||
                other.inviterId == inviterId) &&
            (identical(other.inviterName, inviterName) ||
                other.inviterName == inviterName) &&
            (identical(other.inviteeId, inviteeId) ||
                other.inviteeId == inviteeId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      groupId,
      groupName,
      inviterId,
      inviterName,
      inviteeId,
      status,
      message,
      createdAt,
      expiresAt,
      respondedAt);

  /// Create a copy of GroupInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupInviteImplCopyWith<_$GroupInviteImpl> get copyWith =>
      __$$GroupInviteImplCopyWithImpl<_$GroupInviteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupInviteImplToJson(
      this,
    );
  }
}

abstract class _GroupInvite implements GroupInvite {
  const factory _GroupInvite(
      {required final String id,
      required final String groupId,
      required final String groupName,
      required final String inviterId,
      required final String inviterName,
      required final String inviteeId,
      final String status,
      final String? message,
      final DateTime? createdAt,
      final DateTime? expiresAt,
      final DateTime? respondedAt}) = _$GroupInviteImpl;

  factory _GroupInvite.fromJson(Map<String, dynamic> json) =
      _$GroupInviteImpl.fromJson;

  @override
  String get id;
  @override
  String get groupId;
  @override
  String get groupName;
  @override
  String get inviterId;
  @override
  String get inviterName;
  @override
  String get inviteeId;
  @override
  String get status; // pending, accepted, declined, expired
  @override
  String? get message;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get expiresAt;
  @override
  DateTime? get respondedAt;

  /// Create a copy of GroupInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupInviteImplCopyWith<_$GroupInviteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
