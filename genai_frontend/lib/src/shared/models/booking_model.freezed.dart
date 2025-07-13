// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get courtId => throw _privateConstructorUsedError;
  String get courtName => throw _privateConstructorUsedError;
  DateTime get bookingDate => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // pending, confirmed, cancelled, completed
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get paymentStatus =>
      throw _privateConstructorUsedError; // pending, paid, refunded
  String? get notes => throw _privateConstructorUsedError;
  List<String> get participants =>
      throw _privateConstructorUsedError; // user IDs
  String? get groupId =>
      throw _privateConstructorUsedError; // if booked as a group
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  DateTime? get cancellationDate => throw _privateConstructorUsedError;

  /// Serializes this BookingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
          BookingModel value, $Res Function(BookingModel) then) =
      _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String courtId,
      String courtName,
      DateTime bookingDate,
      String startTime,
      String endTime,
      double totalPrice,
      String status,
      String? paymentMethod,
      String? paymentStatus,
      String? notes,
      List<String> participants,
      String? groupId,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? cancellationReason,
      DateTime? cancellationDate});
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? courtId = null,
    Object? courtName = null,
    Object? bookingDate = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
    Object? notes = freezed,
    Object? participants = null,
    Object? groupId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cancellationReason = freezed,
    Object? cancellationDate = freezed,
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
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      courtName: null == courtName
          ? _value.courtName
          : courtName // ignore: cast_nullable_to_non_nullable
              as String,
      bookingDate: null == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationDate: freezed == cancellationDate
          ? _value.cancellationDate
          : cancellationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingModelImplCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$BookingModelImplCopyWith(
          _$BookingModelImpl value, $Res Function(_$BookingModelImpl) then) =
      __$$BookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String courtId,
      String courtName,
      DateTime bookingDate,
      String startTime,
      String endTime,
      double totalPrice,
      String status,
      String? paymentMethod,
      String? paymentStatus,
      String? notes,
      List<String> participants,
      String? groupId,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? cancellationReason,
      DateTime? cancellationDate});
}

/// @nodoc
class __$$BookingModelImplCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$BookingModelImpl>
    implements _$$BookingModelImplCopyWith<$Res> {
  __$$BookingModelImplCopyWithImpl(
      _$BookingModelImpl _value, $Res Function(_$BookingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? courtId = null,
    Object? courtName = null,
    Object? bookingDate = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? paymentMethod = freezed,
    Object? paymentStatus = freezed,
    Object? notes = freezed,
    Object? participants = null,
    Object? groupId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cancellationReason = freezed,
    Object? cancellationDate = freezed,
  }) {
    return _then(_$BookingModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      courtId: null == courtId
          ? _value.courtId
          : courtId // ignore: cast_nullable_to_non_nullable
              as String,
      courtName: null == courtName
          ? _value.courtName
          : courtName // ignore: cast_nullable_to_non_nullable
              as String,
      bookingDate: null == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationDate: freezed == cancellationDate
          ? _value.cancellationDate
          : cancellationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingModelImpl implements _BookingModel {
  const _$BookingModelImpl(
      {required this.id,
      required this.userId,
      required this.courtId,
      required this.courtName,
      required this.bookingDate,
      required this.startTime,
      required this.endTime,
      required this.totalPrice,
      this.status = 'pending',
      this.paymentMethod,
      this.paymentStatus,
      this.notes,
      final List<String> participants = const [],
      this.groupId,
      this.createdAt,
      this.updatedAt,
      this.cancellationReason,
      this.cancellationDate})
      : _participants = participants;

  factory _$BookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String courtId;
  @override
  final String courtName;
  @override
  final DateTime bookingDate;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final double totalPrice;
  @override
  @JsonKey()
  final String status;
// pending, confirmed, cancelled, completed
  @override
  final String? paymentMethod;
  @override
  final String? paymentStatus;
// pending, paid, refunded
  @override
  final String? notes;
  final List<String> _participants;
  @override
  @JsonKey()
  List<String> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

// user IDs
  @override
  final String? groupId;
// if booked as a group
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? cancellationReason;
  @override
  final DateTime? cancellationDate;

  @override
  String toString() {
    return 'BookingModel(id: $id, userId: $userId, courtId: $courtId, courtName: $courtName, bookingDate: $bookingDate, startTime: $startTime, endTime: $endTime, totalPrice: $totalPrice, status: $status, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, notes: $notes, participants: $participants, groupId: $groupId, createdAt: $createdAt, updatedAt: $updatedAt, cancellationReason: $cancellationReason, cancellationDate: $cancellationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.courtId, courtId) || other.courtId == courtId) &&
            (identical(other.courtName, courtName) ||
                other.courtName == courtName) &&
            (identical(other.bookingDate, bookingDate) ||
                other.bookingDate == bookingDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.cancellationDate, cancellationDate) ||
                other.cancellationDate == cancellationDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      courtId,
      courtName,
      bookingDate,
      startTime,
      endTime,
      totalPrice,
      status,
      paymentMethod,
      paymentStatus,
      notes,
      const DeepCollectionEquality().hash(_participants),
      groupId,
      createdAt,
      updatedAt,
      cancellationReason,
      cancellationDate);

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      __$$BookingModelImplCopyWithImpl<_$BookingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingModelImplToJson(
      this,
    );
  }
}

abstract class _BookingModel implements BookingModel {
  const factory _BookingModel(
      {required final String id,
      required final String userId,
      required final String courtId,
      required final String courtName,
      required final DateTime bookingDate,
      required final String startTime,
      required final String endTime,
      required final double totalPrice,
      final String status,
      final String? paymentMethod,
      final String? paymentStatus,
      final String? notes,
      final List<String> participants,
      final String? groupId,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? cancellationReason,
      final DateTime? cancellationDate}) = _$BookingModelImpl;

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$BookingModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get courtId;
  @override
  String get courtName;
  @override
  DateTime get bookingDate;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  double get totalPrice;
  @override
  String get status; // pending, confirmed, cancelled, completed
  @override
  String? get paymentMethod;
  @override
  String? get paymentStatus; // pending, paid, refunded
  @override
  String? get notes;
  @override
  List<String> get participants; // user IDs
  @override
  String? get groupId; // if booked as a group
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get cancellationReason;
  @override
  DateTime? get cancellationDate;

  /// Create a copy of BookingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingStats _$BookingStatsFromJson(Map<String, dynamic> json) {
  return _BookingStats.fromJson(json);
}

/// @nodoc
mixin _$BookingStats {
  int get totalBookings => throw _privateConstructorUsedError;
  int get completedBookings => throw _privateConstructorUsedError;
  int get cancelledBookings => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  List<String> get favoriteCourts => throw _privateConstructorUsedError;
  List<String> get frequentSports => throw _privateConstructorUsedError;

  /// Serializes this BookingStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingStatsCopyWith<BookingStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStatsCopyWith<$Res> {
  factory $BookingStatsCopyWith(
          BookingStats value, $Res Function(BookingStats) then) =
      _$BookingStatsCopyWithImpl<$Res, BookingStats>;
  @useResult
  $Res call(
      {int totalBookings,
      int completedBookings,
      int cancelledBookings,
      double totalSpent,
      List<String> favoriteCourts,
      List<String> frequentSports});
}

/// @nodoc
class _$BookingStatsCopyWithImpl<$Res, $Val extends BookingStats>
    implements $BookingStatsCopyWith<$Res> {
  _$BookingStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBookings = null,
    Object? completedBookings = null,
    Object? cancelledBookings = null,
    Object? totalSpent = null,
    Object? favoriteCourts = null,
    Object? frequentSports = null,
  }) {
    return _then(_value.copyWith(
      totalBookings: null == totalBookings
          ? _value.totalBookings
          : totalBookings // ignore: cast_nullable_to_non_nullable
              as int,
      completedBookings: null == completedBookings
          ? _value.completedBookings
          : completedBookings // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledBookings: null == cancelledBookings
          ? _value.cancelledBookings
          : cancelledBookings // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      favoriteCourts: null == favoriteCourts
          ? _value.favoriteCourts
          : favoriteCourts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      frequentSports: null == frequentSports
          ? _value.frequentSports
          : frequentSports // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingStatsImplCopyWith<$Res>
    implements $BookingStatsCopyWith<$Res> {
  factory _$$BookingStatsImplCopyWith(
          _$BookingStatsImpl value, $Res Function(_$BookingStatsImpl) then) =
      __$$BookingStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalBookings,
      int completedBookings,
      int cancelledBookings,
      double totalSpent,
      List<String> favoriteCourts,
      List<String> frequentSports});
}

/// @nodoc
class __$$BookingStatsImplCopyWithImpl<$Res>
    extends _$BookingStatsCopyWithImpl<$Res, _$BookingStatsImpl>
    implements _$$BookingStatsImplCopyWith<$Res> {
  __$$BookingStatsImplCopyWithImpl(
      _$BookingStatsImpl _value, $Res Function(_$BookingStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBookings = null,
    Object? completedBookings = null,
    Object? cancelledBookings = null,
    Object? totalSpent = null,
    Object? favoriteCourts = null,
    Object? frequentSports = null,
  }) {
    return _then(_$BookingStatsImpl(
      totalBookings: null == totalBookings
          ? _value.totalBookings
          : totalBookings // ignore: cast_nullable_to_non_nullable
              as int,
      completedBookings: null == completedBookings
          ? _value.completedBookings
          : completedBookings // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledBookings: null == cancelledBookings
          ? _value.cancelledBookings
          : cancelledBookings // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      favoriteCourts: null == favoriteCourts
          ? _value._favoriteCourts
          : favoriteCourts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      frequentSports: null == frequentSports
          ? _value._frequentSports
          : frequentSports // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingStatsImpl implements _BookingStats {
  const _$BookingStatsImpl(
      {this.totalBookings = 0,
      this.completedBookings = 0,
      this.cancelledBookings = 0,
      this.totalSpent = 0.0,
      final List<String> favoriteCourts = const [],
      final List<String> frequentSports = const []})
      : _favoriteCourts = favoriteCourts,
        _frequentSports = frequentSports;

  factory _$BookingStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalBookings;
  @override
  @JsonKey()
  final int completedBookings;
  @override
  @JsonKey()
  final int cancelledBookings;
  @override
  @JsonKey()
  final double totalSpent;
  final List<String> _favoriteCourts;
  @override
  @JsonKey()
  List<String> get favoriteCourts {
    if (_favoriteCourts is EqualUnmodifiableListView) return _favoriteCourts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteCourts);
  }

  final List<String> _frequentSports;
  @override
  @JsonKey()
  List<String> get frequentSports {
    if (_frequentSports is EqualUnmodifiableListView) return _frequentSports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_frequentSports);
  }

  @override
  String toString() {
    return 'BookingStats(totalBookings: $totalBookings, completedBookings: $completedBookings, cancelledBookings: $cancelledBookings, totalSpent: $totalSpent, favoriteCourts: $favoriteCourts, frequentSports: $frequentSports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingStatsImpl &&
            (identical(other.totalBookings, totalBookings) ||
                other.totalBookings == totalBookings) &&
            (identical(other.completedBookings, completedBookings) ||
                other.completedBookings == completedBookings) &&
            (identical(other.cancelledBookings, cancelledBookings) ||
                other.cancelledBookings == cancelledBookings) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            const DeepCollectionEquality()
                .equals(other._favoriteCourts, _favoriteCourts) &&
            const DeepCollectionEquality()
                .equals(other._frequentSports, _frequentSports));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalBookings,
      completedBookings,
      cancelledBookings,
      totalSpent,
      const DeepCollectionEquality().hash(_favoriteCourts),
      const DeepCollectionEquality().hash(_frequentSports));

  /// Create a copy of BookingStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingStatsImplCopyWith<_$BookingStatsImpl> get copyWith =>
      __$$BookingStatsImplCopyWithImpl<_$BookingStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingStatsImplToJson(
      this,
    );
  }
}

abstract class _BookingStats implements BookingStats {
  const factory _BookingStats(
      {final int totalBookings,
      final int completedBookings,
      final int cancelledBookings,
      final double totalSpent,
      final List<String> favoriteCourts,
      final List<String> frequentSports}) = _$BookingStatsImpl;

  factory _BookingStats.fromJson(Map<String, dynamic> json) =
      _$BookingStatsImpl.fromJson;

  @override
  int get totalBookings;
  @override
  int get completedBookings;
  @override
  int get cancelledBookings;
  @override
  double get totalSpent;
  @override
  List<String> get favoriteCourts;
  @override
  List<String> get frequentSports;

  /// Create a copy of BookingStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingStatsImplCopyWith<_$BookingStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
