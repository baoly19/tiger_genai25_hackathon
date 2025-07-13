// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupModelImpl _$$GroupModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      ownerId: json['ownerId'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      privacy: json['privacy'] as String? ?? 'public',
      sportTypes: (json['sportTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => GroupMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      maxMembers: (json['maxMembers'] as num?)?.toInt() ?? 0,
      location: json['location'] as String?,
      settings: json['settings'] as Map<String, dynamic>? ?? const {},
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ownerId': instance.ownerId,
      'avatarUrl': instance.avatarUrl,
      'privacy': instance.privacy,
      'sportTypes': instance.sportTypes,
      'members': instance.members,
      'maxMembers': instance.maxMembers,
      'location': instance.location,
      'settings': instance.settings,
      'tags': instance.tags,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$GroupMemberImpl _$$GroupMemberImplFromJson(Map<String, dynamic> json) =>
    _$GroupMemberImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userAvatarUrl: json['userAvatarUrl'] as String?,
      role: json['role'] as String? ?? 'member',
      joinedAt: json['joinedAt'] == null
          ? null
          : DateTime.parse(json['joinedAt'] as String),
      isActive: json['isActive'] as bool? ?? true,
      skillLevel: json['skillLevel'] as String?,
    );

Map<String, dynamic> _$$GroupMemberImplToJson(_$GroupMemberImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userAvatarUrl': instance.userAvatarUrl,
      'role': instance.role,
      'joinedAt': instance.joinedAt?.toIso8601String(),
      'isActive': instance.isActive,
      'skillLevel': instance.skillLevel,
    };

_$GroupMessageImpl _$$GroupMessageImplFromJson(Map<String, dynamic> json) =>
    _$GroupMessageImpl(
      id: json['id'] as String,
      groupId: json['groupId'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderAvatarUrl: json['senderAvatarUrl'] as String?,
      content: json['content'] as String,
      messageType: json['messageType'] as String? ?? 'text',
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isEdited: json['isEdited'] as bool? ?? false,
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$$GroupMessageImplToJson(_$GroupMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderAvatarUrl': instance.senderAvatarUrl,
      'content': instance.content,
      'messageType': instance.messageType,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isEdited': instance.isEdited,
      'editedAt': instance.editedAt?.toIso8601String(),
    };

_$GroupInviteImpl _$$GroupInviteImplFromJson(Map<String, dynamic> json) =>
    _$GroupInviteImpl(
      id: json['id'] as String,
      groupId: json['groupId'] as String,
      groupName: json['groupName'] as String,
      inviterId: json['inviterId'] as String,
      inviterName: json['inviterName'] as String,
      inviteeId: json['inviteeId'] as String,
      status: json['status'] as String? ?? 'pending',
      message: json['message'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      respondedAt: json['respondedAt'] == null
          ? null
          : DateTime.parse(json['respondedAt'] as String),
    );

Map<String, dynamic> _$$GroupInviteImplToJson(_$GroupInviteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'groupName': instance.groupName,
      'inviterId': instance.inviterId,
      'inviterName': instance.inviterName,
      'inviteeId': instance.inviteeId,
      'status': instance.status,
      'message': instance.message,
      'createdAt': instance.createdAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'respondedAt': instance.respondedAt?.toIso8601String(),
    };
