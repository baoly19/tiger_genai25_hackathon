import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
class ActivityModel with _$ActivityModel {
  const factory ActivityModel({
    required String id,
    required String userId,
    required String type, // booking, group, event, court_review, achievement, etc.
    required String title,
    required String description,
    String? entityId, // court_id, group_id, event_id, etc.
    String? entityType, // court, group, event, etc.
    String? entityName, // name of court, group, event
    String? location,
    String? imageUrl,
    Map<String, dynamic>? metadata, // additional data specific to activity type
    @Default('normal') String priority, // normal, high, important
    DateTime? actionDate, // when the actual activity happened (different from createdAt)
    DateTime? createdAt,
  }) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => _$ActivityModelFromJson(json);
}

@freezed
class ActivitySummary with _$ActivitySummary {
  const factory ActivitySummary({
    @Default(0) int totalActivities,
    @Default(0) int thisWeekActivities,
    @Default(0) int thisMonthActivities,
    @Default(0) int bookingsCount,
    @Default(0) int groupsJoined,
    @Default(0) int eventsAttended,
    @Default(0) int courtsReviewed,
    @Default([]) List<String> favoriteActivities,
    @Default([]) List<String> recentLocations,
    DateTime? lastActivity,
  }) = _ActivitySummary;

  factory ActivitySummary.fromJson(Map<String, dynamic> json) => _$ActivitySummaryFromJson(json);
} 