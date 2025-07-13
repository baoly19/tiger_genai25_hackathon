// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventModelImpl _$$EventModelImplFromJson(Map<String, dynamic> json) =>
    _$EventModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      organizerId: json['organizerId'] as String,
      organizerName: json['organizerName'] as String,
      organizerAvatarUrl: json['organizerAvatarUrl'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      location: json['location'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      courtId: json['courtId'] as String?,
      sportTypes: (json['sportTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      maxParticipants: (json['maxParticipants'] as num?)?.toInt() ?? 0,
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => EventParticipant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      price: (json['price'] as num?)?.toDouble(),
      priceType: json['priceType'] as String? ?? 'free',
      registrationStatus: json['registrationStatus'] as String? ?? 'open',
      status: json['status'] as String? ?? 'upcoming',
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      requirements: json['requirements'] as String?,
      registrationDeadline: json['registrationDeadline'] == null
          ? null
          : DateTime.parse(json['registrationDeadline'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EventModelImplToJson(_$EventModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'organizerId': instance.organizerId,
      'organizerName': instance.organizerName,
      'organizerAvatarUrl': instance.organizerAvatarUrl,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'courtId': instance.courtId,
      'sportTypes': instance.sportTypes,
      'maxParticipants': instance.maxParticipants,
      'participants': instance.participants,
      'price': instance.price,
      'priceType': instance.priceType,
      'registrationStatus': instance.registrationStatus,
      'status': instance.status,
      'imageUrls': instance.imageUrls,
      'tags': instance.tags,
      'requirements': instance.requirements,
      'registrationDeadline': instance.registrationDeadline?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$EventParticipantImpl _$$EventParticipantImplFromJson(
        Map<String, dynamic> json) =>
    _$EventParticipantImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userAvatarUrl: json['userAvatarUrl'] as String?,
      registeredAt: DateTime.parse(json['registeredAt'] as String),
      status: json['status'] as String? ?? 'registered',
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$EventParticipantImplToJson(
        _$EventParticipantImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userAvatarUrl': instance.userAvatarUrl,
      'registeredAt': instance.registeredAt.toIso8601String(),
      'status': instance.status,
      'notes': instance.notes,
    };
