import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@freezed
class GroupModel with _$GroupModel {
  const factory GroupModel({
    required String id,
    required String name,
    required String description,
    required String ownerId,
    String? avatarUrl,
    @Default('public') String privacy, // public, private, invite_only
    @Default([]) List<String> sportTypes,
    @Default([]) List<GroupMember> members,
    @Default(0) int maxMembers,
    String? location,
    @Default({}) Map<String, dynamic> settings,
    @Default([]) List<String> tags,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) => _$GroupModelFromJson(json);
}

@freezed
class GroupMember with _$GroupMember {
  const factory GroupMember({
    required String userId,
    required String userName,
    String? userAvatarUrl,
    @Default('member') String role, // owner, admin, member
    DateTime? joinedAt,
    @Default(true) bool isActive,
    String? skillLevel,
  }) = _GroupMember;

  factory GroupMember.fromJson(Map<String, dynamic> json) => _$GroupMemberFromJson(json);
}

@freezed
class GroupMessage with _$GroupMessage {
  const factory GroupMessage({
    required String id,
    required String groupId,
    required String senderId,
    required String senderName,
    String? senderAvatarUrl,
    required String content,
    @Default('text') String messageType, // text, image, booking, event
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    @Default(false) bool isEdited,
    DateTime? editedAt,
  }) = _GroupMessage;

  factory GroupMessage.fromJson(Map<String, dynamic> json) => _$GroupMessageFromJson(json);
}

@freezed
class GroupInvite with _$GroupInvite {
  const factory GroupInvite({
    required String id,
    required String groupId,
    required String groupName,
    required String inviterId,
    required String inviterName,
    required String inviteeId,
    @Default('pending') String status, // pending, accepted, declined, expired
    String? message,
    DateTime? createdAt,
    DateTime? expiresAt,
    DateTime? respondedAt,
  }) = _GroupInvite;

  factory GroupInvite.fromJson(Map<String, dynamic> json) => _$GroupInviteFromJson(json);
} 