import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String userId,
    required String title,
    required String message,
    @Default('general') String type, // booking, group_invite, event, reminder, system
    @Default(false) bool isRead,
    Map<String, dynamic>? data, // additional data like booking_id, group_id, etc.
    String? actionUrl, // deep link
    @Default('medium') String priority, // low, medium, high, urgent
    DateTime? createdAt,
    DateTime? readAt,
    DateTime? expiresAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @Default(true) bool bookingReminders,
    @Default(true) bool groupInvites,
    @Default(true) bool eventUpdates,
    @Default(true) bool newMessages,
    @Default(false) bool marketingEmails,
    @Default(true) bool pushNotifications,
    @Default(true) bool emailNotifications,
    @Default('1hour') String bookingReminderTime, // 30min, 1hour, 2hours, 1day
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) => _$NotificationSettingsFromJson(json);
} 