// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      location: json['location'] as String?,
      age: (json['age'] as num?)?.toInt(),
      skillLevel: json['skillLevel'] as String? ?? 'beginner',
      preferences: json['preferences'] as Map<String, dynamic>?,
      favoriteGroups: (json['favoriteGroups'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recentBookings: (json['recentBookings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastActiveAt: json['lastActiveAt'] == null
          ? null
          : DateTime.parse(json['lastActiveAt'] as String),
      isVerified: json['isVerified'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'location': instance.location,
      'age': instance.age,
      'skillLevel': instance.skillLevel,
      'preferences': instance.preferences,
      'favoriteGroups': instance.favoriteGroups,
      'recentBookings': instance.recentBookings,
      'lastActiveAt': instance.lastActiveAt?.toIso8601String(),
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      sportTypes: (json['sportTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preferredTimeSlot: json['preferredTimeSlot'] as String? ?? 'any',
      maxDistance: (json['maxDistance'] as num?)?.toDouble(),
      preferredLevel: json['preferredLevel'] as String? ?? 'any',
      allowNotifications: json['allowNotifications'] as bool? ?? true,
      allowGroupInvites: json['allowGroupInvites'] as bool? ?? true,
      isPrivateProfile: json['isPrivateProfile'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'sportTypes': instance.sportTypes,
      'preferredTimeSlot': instance.preferredTimeSlot,
      'maxDistance': instance.maxDistance,
      'preferredLevel': instance.preferredLevel,
      'allowNotifications': instance.allowNotifications,
      'allowGroupInvites': instance.allowGroupInvites,
      'isPrivateProfile': instance.isPrivateProfile,
    };
