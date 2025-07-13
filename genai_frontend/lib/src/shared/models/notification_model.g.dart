// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: json['type'] as String? ?? 'general',
      isRead: json['isRead'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
      actionUrl: json['actionUrl'] as String?,
      priority: json['priority'] as String? ?? 'medium',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'message': instance.message,
      'type': instance.type,
      'isRead': instance.isRead,
      'data': instance.data,
      'actionUrl': instance.actionUrl,
      'priority': instance.priority,
      'createdAt': instance.createdAt?.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingsImpl(
      bookingReminders: json['bookingReminders'] as bool? ?? true,
      groupInvites: json['groupInvites'] as bool? ?? true,
      eventUpdates: json['eventUpdates'] as bool? ?? true,
      newMessages: json['newMessages'] as bool? ?? true,
      marketingEmails: json['marketingEmails'] as bool? ?? false,
      pushNotifications: json['pushNotifications'] as bool? ?? true,
      emailNotifications: json['emailNotifications'] as bool? ?? true,
      bookingReminderTime: json['bookingReminderTime'] as String? ?? '1hour',
    );

Map<String, dynamic> _$$NotificationSettingsImplToJson(
        _$NotificationSettingsImpl instance) =>
    <String, dynamic>{
      'bookingReminders': instance.bookingReminders,
      'groupInvites': instance.groupInvites,
      'eventUpdates': instance.eventUpdates,
      'newMessages': instance.newMessages,
      'marketingEmails': instance.marketingEmails,
      'pushNotifications': instance.pushNotifications,
      'emailNotifications': instance.emailNotifications,
      'bookingReminderTime': instance.bookingReminderTime,
    };
