import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

enum BookingStatus {
  pending,
  confirmed,
  cancelled,
  completed,
}

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({
    required String id,
    required String userId,
    required String courtId,
    required String courtName,
    required DateTime bookingDate,
    required String startTime,
    required String endTime,
    required double totalPrice,
    @Default('pending') String status, // pending, confirmed, cancelled, completed
    String? paymentMethod,
    String? paymentStatus, // pending, paid, refunded
    String? notes,
    @Default([]) List<String> participants, // user IDs
    String? groupId, // if booked as a group
    DateTime? createdAt,
    DateTime? updatedAt,
    String? cancellationReason,
    DateTime? cancellationDate,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
}

@freezed
class BookingStats with _$BookingStats {
  const factory BookingStats({
    @Default(0) int totalBookings,
    @Default(0) int completedBookings,
    @Default(0) int cancelledBookings,
    @Default(0.0) double totalSpent,
    @Default([]) List<String> favoriteCourts,
    @Default([]) List<String> frequentSports,
  }) = _BookingStats;

  factory BookingStats.fromJson(Map<String, dynamic> json) => _$BookingStatsFromJson(json);
} 