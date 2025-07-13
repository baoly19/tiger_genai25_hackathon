// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityModelImpl _$$ActivityModelImplFromJson(Map<String, dynamic> json) =>
    _$ActivityModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      entityId: json['entityId'] as String?,
      entityType: json['entityType'] as String?,
      entityName: json['entityName'] as String?,
      location: json['location'] as String?,
      imageUrl: json['imageUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      priority: json['priority'] as String? ?? 'normal',
      actionDate: json['actionDate'] == null
          ? null
          : DateTime.parse(json['actionDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ActivityModelImplToJson(_$ActivityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'entityId': instance.entityId,
      'entityType': instance.entityType,
      'entityName': instance.entityName,
      'location': instance.location,
      'imageUrl': instance.imageUrl,
      'metadata': instance.metadata,
      'priority': instance.priority,
      'actionDate': instance.actionDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$ActivitySummaryImpl _$$ActivitySummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivitySummaryImpl(
      totalActivities: (json['totalActivities'] as num?)?.toInt() ?? 0,
      thisWeekActivities: (json['thisWeekActivities'] as num?)?.toInt() ?? 0,
      thisMonthActivities: (json['thisMonthActivities'] as num?)?.toInt() ?? 0,
      bookingsCount: (json['bookingsCount'] as num?)?.toInt() ?? 0,
      groupsJoined: (json['groupsJoined'] as num?)?.toInt() ?? 0,
      eventsAttended: (json['eventsAttended'] as num?)?.toInt() ?? 0,
      courtsReviewed: (json['courtsReviewed'] as num?)?.toInt() ?? 0,
      favoriteActivities: (json['favoriteActivities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recentLocations: (json['recentLocations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastActivity: json['lastActivity'] == null
          ? null
          : DateTime.parse(json['lastActivity'] as String),
    );

Map<String, dynamic> _$$ActivitySummaryImplToJson(
        _$ActivitySummaryImpl instance) =>
    <String, dynamic>{
      'totalActivities': instance.totalActivities,
      'thisWeekActivities': instance.thisWeekActivities,
      'thisMonthActivities': instance.thisMonthActivities,
      'bookingsCount': instance.bookingsCount,
      'groupsJoined': instance.groupsJoined,
      'eventsAttended': instance.eventsAttended,
      'courtsReviewed': instance.courtsReviewed,
      'favoriteActivities': instance.favoriteActivities,
      'recentLocations': instance.recentLocations,
      'lastActivity': instance.lastActivity?.toIso8601String(),
    };
