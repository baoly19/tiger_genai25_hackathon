// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourtModelImpl _$$CourtModelImplFromJson(Map<String, dynamic> json) =>
    _$CourtModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      ownerId: json['ownerId'] as String,
      sportTypes: (json['sportTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      pricePerHour: (json['pricePerHour'] as num).toDouble(),
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      amenities: json['amenities'] as Map<String, dynamic>? ?? const {},
      status: json['status'] as String? ?? 'active',
      schedules: (json['schedules'] as List<dynamic>?)
              ?.map((e) => CourtSchedule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      totalReviews: (json['totalReviews'] as num?)?.toInt() ?? 0,
      availableTimeSlots: (json['availableTimeSlots'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CourtModelImplToJson(_$CourtModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'ownerId': instance.ownerId,
      'sportTypes': instance.sportTypes,
      'pricePerHour': instance.pricePerHour,
      'imageUrls': instance.imageUrls,
      'amenities': instance.amenities,
      'status': instance.status,
      'schedules': instance.schedules,
      'rating': instance.rating,
      'totalReviews': instance.totalReviews,
      'availableTimeSlots': instance.availableTimeSlots,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$CourtScheduleImpl _$$CourtScheduleImplFromJson(Map<String, dynamic> json) =>
    _$CourtScheduleImpl(
      dayOfWeek: json['dayOfWeek'] as String,
      openTime: json['openTime'] as String,
      closeTime: json['closeTime'] as String,
      isOpen: json['isOpen'] as bool? ?? true,
      blockedSlots: (json['blockedSlots'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CourtScheduleImplToJson(_$CourtScheduleImpl instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'isOpen': instance.isOpen,
      'blockedSlots': instance.blockedSlots,
    };

_$CourtReviewImpl _$$CourtReviewImplFromJson(Map<String, dynamic> json) =>
    _$CourtReviewImpl(
      id: json['id'] as String,
      courtId: json['courtId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userAvatarUrl: json['userAvatarUrl'] as String?,
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CourtReviewImplToJson(_$CourtReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courtId': instance.courtId,
      'userId': instance.userId,
      'userName': instance.userName,
      'userAvatarUrl': instance.userAvatarUrl,
      'rating': instance.rating,
      'comment': instance.comment,
      'imageUrls': instance.imageUrls,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
