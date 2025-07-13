// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      courtId: json['courtId'] as String,
      courtName: json['courtName'] as String,
      bookingDate: DateTime.parse(json['bookingDate'] as String),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      status: json['status'] as String? ?? 'pending',
      paymentMethod: json['paymentMethod'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      notes: json['notes'] as String?,
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      groupId: json['groupId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      cancellationReason: json['cancellationReason'] as String?,
      cancellationDate: json['cancellationDate'] == null
          ? null
          : DateTime.parse(json['cancellationDate'] as String),
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'courtId': instance.courtId,
      'courtName': instance.courtName,
      'bookingDate': instance.bookingDate.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'paymentMethod': instance.paymentMethod,
      'paymentStatus': instance.paymentStatus,
      'notes': instance.notes,
      'participants': instance.participants,
      'groupId': instance.groupId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'cancellationReason': instance.cancellationReason,
      'cancellationDate': instance.cancellationDate?.toIso8601String(),
    };

_$BookingStatsImpl _$$BookingStatsImplFromJson(Map<String, dynamic> json) =>
    _$BookingStatsImpl(
      totalBookings: (json['totalBookings'] as num?)?.toInt() ?? 0,
      completedBookings: (json['completedBookings'] as num?)?.toInt() ?? 0,
      cancelledBookings: (json['cancelledBookings'] as num?)?.toInt() ?? 0,
      totalSpent: (json['totalSpent'] as num?)?.toDouble() ?? 0.0,
      favoriteCourts: (json['favoriteCourts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      frequentSports: (json['frequentSports'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BookingStatsImplToJson(_$BookingStatsImpl instance) =>
    <String, dynamic>{
      'totalBookings': instance.totalBookings,
      'completedBookings': instance.completedBookings,
      'cancelledBookings': instance.cancelledBookings,
      'totalSpent': instance.totalSpent,
      'favoriteCourts': instance.favoriteCourts,
      'frequentSports': instance.frequentSports,
    };
