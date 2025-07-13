import 'package:freezed_annotation/freezed_annotation.dart';

part 'court_model.freezed.dart';
part 'court_model.g.dart';

@freezed
class CourtModel with _$CourtModel {
  const factory CourtModel({
    required String id,
    required String name,
    required String description,
    required String location,
    required double latitude,
    required double longitude,
    required String ownerId,
    @Default([]) List<String> sportTypes, // tennis, basketball, badminton, etc.
    required double pricePerHour,
    @Default([]) List<String> imageUrls,
    @Default({}) Map<String, dynamic> amenities, // parking, changing_room, equipment_rental, etc.
    @Default('active') String status, // active, inactive, maintenance
    @Default([]) List<CourtSchedule> schedules,
    @Default(0.0) double rating,
    @Default(0) int totalReviews,
    @Default([]) List<String> availableTimeSlots,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CourtModel;

  factory CourtModel.fromJson(Map<String, dynamic> json) => _$CourtModelFromJson(json);
}

@freezed
class CourtSchedule with _$CourtSchedule {
  const factory CourtSchedule({
    required String dayOfWeek, // monday, tuesday, etc.
    required String openTime, // 08:00
    required String closeTime, // 22:00
    @Default(true) bool isOpen,
    @Default([]) List<String> blockedSlots, // blocked time slots
  }) = _CourtSchedule;

  factory CourtSchedule.fromJson(Map<String, dynamic> json) => _$CourtScheduleFromJson(json);
}

@freezed
class CourtReview with _$CourtReview {
  const factory CourtReview({
    required String id,
    required String courtId,
    required String userId,
    required String userName,
    String? userAvatarUrl,
    required double rating,
    String? comment,
    @Default([]) List<String> imageUrls,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CourtReview;

  factory CourtReview.fromJson(Map<String, dynamic> json) => _$CourtReviewFromJson(json);
} 