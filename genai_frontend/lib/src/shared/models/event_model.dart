import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String title,
    required String description,
    required String organizerId,
    required String organizerName,
    String? organizerAvatarUrl,
    required DateTime startTime,
    required DateTime endTime,
    required String location,
    double? latitude,
    double? longitude,
    String? courtId,
    @Default([]) List<String> sportTypes,
    @Default(0) int maxParticipants,
    @Default([]) List<EventParticipant> participants,
    double? price,
    @Default('free') String priceType, // free, paid, donation
    @Default('open') String registrationStatus, // open, closed, full
    @Default('upcoming') String status, // upcoming, ongoing, completed, cancelled
    @Default([]) List<String> imageUrls,
    @Default([]) List<String> tags,
    String? requirements, // skill level, equipment, etc.
    DateTime? registrationDeadline,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);
}

@freezed
class EventParticipant with _$EventParticipant {
  const factory EventParticipant({
    required String userId,
    required String userName,
    String? userAvatarUrl,
    required DateTime registeredAt,
    @Default('registered') String status, // registered, waitlist, cancelled
    String? notes,
  }) = _EventParticipant;

  factory EventParticipant.fromJson(Map<String, dynamic> json) => _$EventParticipantFromJson(json);
} 