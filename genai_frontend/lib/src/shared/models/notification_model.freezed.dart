// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // booking, group_invite, event, reminder, system
  bool get isRead => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data =>
      throw _privateConstructorUsedError; // additional data like booking_id, group_id, etc.
  String? get actionUrl => throw _privateConstructorUsedError; // deep link
  String get priority =>
      throw _privateConstructorUsedError; // low, medium, high, urgent
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String message,
      String type,
      bool isRead,
      Map<String, dynamic>? data,
      String? actionUrl,
      String priority,
      DateTime? createdAt,
      DateTime? readAt,
      DateTime? expiresAt});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? isRead = null,
    Object? data = freezed,
    Object? actionUrl = freezed,
    Object? priority = null,
    Object? createdAt = freezed,
    Object? readAt = freezed,
    Object? expiresAt = freezed,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(_$NotificationModelImpl value,
          $Res Function(_$NotificationModelImpl) then) =
      __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String message,
      String type,
      bool isRead,
      Map<String, dynamic>? data,
      String? actionUrl,
      String priority,
      DateTime? createdAt,
      DateTime? readAt,
      DateTime? expiresAt});
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(_$NotificationModelImpl _value,
      $Res Function(_$NotificationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? isRead = null,
    Object? data = freezed,
    Object? actionUrl = freezed,
    Object? priority = null,
    Object? createdAt = freezed,
    Object? readAt = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(_$NotificationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelImpl implements _NotificationModel {
  const _$NotificationModelImpl(
      {required this.id,
      required this.userId,
      required this.title,
      required this.message,
      this.type = 'general',
      this.isRead = false,
      final Map<String, dynamic>? data,
      this.actionUrl,
      this.priority = 'medium',
      this.createdAt,
      this.readAt,
      this.expiresAt})
      : _data = data;

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String message;
  @override
  @JsonKey()
  final String type;
// booking, group_invite, event, reminder, system
  @override
  @JsonKey()
  final bool isRead;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// additional data like booking_id, group_id, etc.
  @override
  final String? actionUrl;
// deep link
  @override
  @JsonKey()
  final String priority;
// low, medium, high, urgent
  @override
  final DateTime? createdAt;
  @override
  final DateTime? readAt;
  @override
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'NotificationModel(id: $id, userId: $userId, title: $title, message: $message, type: $type, isRead: $isRead, data: $data, actionUrl: $actionUrl, priority: $priority, createdAt: $createdAt, readAt: $readAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      message,
      type,
      isRead,
      const DeepCollectionEquality().hash(_data),
      actionUrl,
      priority,
      createdAt,
      readAt,
      expiresAt);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements NotificationModel {
  const factory _NotificationModel(
      {required final String id,
      required final String userId,
      required final String title,
      required final String message,
      final String type,
      final bool isRead,
      final Map<String, dynamic>? data,
      final String? actionUrl,
      final String priority,
      final DateTime? createdAt,
      final DateTime? readAt,
      final DateTime? expiresAt}) = _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get message;
  @override
  String get type; // booking, group_invite, event, reminder, system
  @override
  bool get isRead;
  @override
  Map<String, dynamic>?
      get data; // additional data like booking_id, group_id, etc.
  @override
  String? get actionUrl; // deep link
  @override
  String get priority; // low, medium, high, urgent
  @override
  DateTime? get createdAt;
  @override
  DateTime? get readAt;
  @override
  DateTime? get expiresAt;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  bool get bookingReminders => throw _privateConstructorUsedError;
  bool get groupInvites => throw _privateConstructorUsedError;
  bool get eventUpdates => throw _privateConstructorUsedError;
  bool get newMessages => throw _privateConstructorUsedError;
  bool get marketingEmails => throw _privateConstructorUsedError;
  bool get pushNotifications => throw _privateConstructorUsedError;
  bool get emailNotifications => throw _privateConstructorUsedError;
  String get bookingReminderTime => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) then) =
      _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call(
      {bool bookingReminders,
      bool groupInvites,
      bool eventUpdates,
      bool newMessages,
      bool marketingEmails,
      bool pushNotifications,
      bool emailNotifications,
      String bookingReminderTime});
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res,
        $Val extends NotificationSettings>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingReminders = null,
    Object? groupInvites = null,
    Object? eventUpdates = null,
    Object? newMessages = null,
    Object? marketingEmails = null,
    Object? pushNotifications = null,
    Object? emailNotifications = null,
    Object? bookingReminderTime = null,
  }) {
    return _then(_value.copyWith(
      bookingReminders: null == bookingReminders
          ? _value.bookingReminders
          : bookingReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      groupInvites: null == groupInvites
          ? _value.groupInvites
          : groupInvites // ignore: cast_nullable_to_non_nullable
              as bool,
      eventUpdates: null == eventUpdates
          ? _value.eventUpdates
          : eventUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      newMessages: null == newMessages
          ? _value.newMessages
          : newMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingEmails: null == marketingEmails
          ? _value.marketingEmails
          : marketingEmails // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingReminderTime: null == bookingReminderTime
          ? _value.bookingReminderTime
          : bookingReminderTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingsImplCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$NotificationSettingsImplCopyWith(_$NotificationSettingsImpl value,
          $Res Function(_$NotificationSettingsImpl) then) =
      __$$NotificationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool bookingReminders,
      bool groupInvites,
      bool eventUpdates,
      bool newMessages,
      bool marketingEmails,
      bool pushNotifications,
      bool emailNotifications,
      String bookingReminderTime});
}

/// @nodoc
class __$$NotificationSettingsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$NotificationSettingsImpl>
    implements _$$NotificationSettingsImplCopyWith<$Res> {
  __$$NotificationSettingsImplCopyWithImpl(_$NotificationSettingsImpl _value,
      $Res Function(_$NotificationSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingReminders = null,
    Object? groupInvites = null,
    Object? eventUpdates = null,
    Object? newMessages = null,
    Object? marketingEmails = null,
    Object? pushNotifications = null,
    Object? emailNotifications = null,
    Object? bookingReminderTime = null,
  }) {
    return _then(_$NotificationSettingsImpl(
      bookingReminders: null == bookingReminders
          ? _value.bookingReminders
          : bookingReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      groupInvites: null == groupInvites
          ? _value.groupInvites
          : groupInvites // ignore: cast_nullable_to_non_nullable
              as bool,
      eventUpdates: null == eventUpdates
          ? _value.eventUpdates
          : eventUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      newMessages: null == newMessages
          ? _value.newMessages
          : newMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingEmails: null == marketingEmails
          ? _value.marketingEmails
          : marketingEmails // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingReminderTime: null == bookingReminderTime
          ? _value.bookingReminderTime
          : bookingReminderTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl implements _NotificationSettings {
  const _$NotificationSettingsImpl(
      {this.bookingReminders = true,
      this.groupInvites = true,
      this.eventUpdates = true,
      this.newMessages = true,
      this.marketingEmails = false,
      this.pushNotifications = true,
      this.emailNotifications = true,
      this.bookingReminderTime = '1hour'});

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool bookingReminders;
  @override
  @JsonKey()
  final bool groupInvites;
  @override
  @JsonKey()
  final bool eventUpdates;
  @override
  @JsonKey()
  final bool newMessages;
  @override
  @JsonKey()
  final bool marketingEmails;
  @override
  @JsonKey()
  final bool pushNotifications;
  @override
  @JsonKey()
  final bool emailNotifications;
  @override
  @JsonKey()
  final String bookingReminderTime;

  @override
  String toString() {
    return 'NotificationSettings(bookingReminders: $bookingReminders, groupInvites: $groupInvites, eventUpdates: $eventUpdates, newMessages: $newMessages, marketingEmails: $marketingEmails, pushNotifications: $pushNotifications, emailNotifications: $emailNotifications, bookingReminderTime: $bookingReminderTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.bookingReminders, bookingReminders) ||
                other.bookingReminders == bookingReminders) &&
            (identical(other.groupInvites, groupInvites) ||
                other.groupInvites == groupInvites) &&
            (identical(other.eventUpdates, eventUpdates) ||
                other.eventUpdates == eventUpdates) &&
            (identical(other.newMessages, newMessages) ||
                other.newMessages == newMessages) &&
            (identical(other.marketingEmails, marketingEmails) ||
                other.marketingEmails == marketingEmails) &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.bookingReminderTime, bookingReminderTime) ||
                other.bookingReminderTime == bookingReminderTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingReminders,
      groupInvites,
      eventUpdates,
      newMessages,
      marketingEmails,
      pushNotifications,
      emailNotifications,
      bookingReminderTime);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith =>
          __$$NotificationSettingsImplCopyWithImpl<_$NotificationSettingsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsImplToJson(
      this,
    );
  }
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings(
      {final bool bookingReminders,
      final bool groupInvites,
      final bool eventUpdates,
      final bool newMessages,
      final bool marketingEmails,
      final bool pushNotifications,
      final bool emailNotifications,
      final String bookingReminderTime}) = _$NotificationSettingsImpl;

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  bool get bookingReminders;
  @override
  bool get groupInvites;
  @override
  bool get eventUpdates;
  @override
  bool get newMessages;
  @override
  bool get marketingEmails;
  @override
  bool get pushNotifications;
  @override
  bool get emailNotifications;
  @override
  String get bookingReminderTime;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
