import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String name,
    String? avatarUrl,
    String? location,
    int? age,
    @Default('beginner') String skillLevel, // beginner, intermediate, advanced, expert
    Map<String, dynamic>? preferences,
    @Default([]) List<String> favoriteGroups,
    @Default([]) List<String> recentBookings,
    DateTime? lastActiveAt,
    @Default(false) bool isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

// User preferences structure
@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default([]) List<String> sportTypes, // tennis, basketball, badminton, etc.
    @Default('any') String preferredTimeSlot, // morning, afternoon, evening, any
    double? maxDistance, // in km
    @Default('any') String preferredLevel, // same_level, any_level, below_level
    @Default(true) bool allowNotifications,
    @Default(true) bool allowGroupInvites,
    @Default(false) bool isPrivateProfile,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);
} 