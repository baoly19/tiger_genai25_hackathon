import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/group_model.dart';
import '../../core/services/supabase_service.dart';

part 'group_repository.g.dart';

class GroupRepository {
  final SupabaseClient _client;
  
  GroupRepository(this._client);
  
  // Create new group
  Future<GroupModel> createGroup(GroupModel group) async {
    try {
      final response = await _client
          .from(SupabaseService.groupsTable)
          .insert(group.toJson())
          .select()
          .single();
      
      // Add creator as owner
      await addGroupMember(
        response['id'],
        GroupMember(
          userId: group.ownerId,
          userName: 'Creator', // This should be fetched from user data
          role: 'owner',
          joinedAt: DateTime.now(),
        ),
      );
      
      return GroupModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Get group by ID
  Future<GroupModel?> getGroupById(String groupId) async {
    try {
      final response = await _client
          .from(SupabaseService.groupsTable)
          .select('''
            *,
            group_members(
              user_id,
              user_name,
              user_avatar_url,
              role,
              joined_at,
              is_active,
              skill_level
            )
          ''')
          .eq('id', groupId)
          .eq('is_active', true)
          .single();
      
      return GroupModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }
  
  // Get all groups with filters
  Future<List<GroupModel>> getGroups({
    String? sportType,
    String? location,
    String? privacy = 'public',
    int? limit = 20,
    int? offset = 0,
  }) async {
    try {
      var query = _client
          .from(SupabaseService.groupsTable)
          .select('''
            *,
            group_members(count)
          ''')
          .eq('is_active', true);
      
      if (sportType != null) {
        query = query.contains('sport_types', [sportType]);
      }
      
      if (location != null) {
        query = query.ilike('location', '%$location%');
      }
      
      if (privacy != null) {
        query = query.eq('privacy', privacy);
      }
      
      if (limit != null) {
        query = query.limit(limit);
      }
      
      if (offset != null) {
        query = query.range(offset, offset + (limit ?? 20) - 1);
      }
      
      query = query.order('created_at', ascending: false);
      
      final response = await query;
      
      return response.map<GroupModel>((json) => GroupModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Search groups
  Future<List<GroupModel>> searchGroups(String searchQuery) async {
    try {
      final response = await _client
          .from(SupabaseService.groupsTable)
          .select('''
            *,
            group_members(count)
          ''')
          .or('name.ilike.%$searchQuery%,description.ilike.%$searchQuery%')
          .eq('is_active', true)
          .eq('privacy', 'public')
          .limit(20);
      
      return response.map<GroupModel>((json) => GroupModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Get user groups
  Future<List<GroupModel>> getUserGroups(String userId) async {
    try {
      final response = await _client
          .from(SupabaseService.groupMembersTable)
          .select('''
            groups(
              *,
              group_members(count)
            )
          ''')
          .eq('user_id', userId)
          .eq('is_active', true);
      
      return response
          .map<GroupModel>((json) => GroupModel.fromJson(json['groups']))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Update group
  Future<GroupModel> updateGroup(GroupModel group) async {
    try {
      final response = await _client
          .from(SupabaseService.groupsTable)
          .update(group.copyWith(updatedAt: DateTime.now()).toJson())
          .eq('id', group.id)
          .select()
          .single();
      
      return GroupModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Delete group (soft delete)
  Future<void> deleteGroup(String groupId) async {
    try {
      await _client
          .from(SupabaseService.groupsTable)
          .update({
            'is_active': false,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', groupId);
    } catch (e) {
      rethrow;
    }
  }
  
  // Add group member
  Future<void> addGroupMember(String groupId, GroupMember member) async {
    try {
      await _client
          .from(SupabaseService.groupMembersTable)
          .insert({
            'group_id': groupId,
            'user_id': member.userId,
            'user_name': member.userName,
            'user_avatar_url': member.userAvatarUrl,
            'role': member.role,
            'joined_at': (member.joinedAt ?? DateTime.now()).toIso8601String(),
            'is_active': member.isActive,
            'skill_level': member.skillLevel,
          });
    } catch (e) {
      rethrow;
    }
  }
  
  // Remove group member
  Future<void> removeGroupMember(String groupId, String userId) async {
    try {
      await _client
          .from(SupabaseService.groupMembersTable)
          .update({'is_active': false})
          .eq('group_id', groupId)
          .eq('user_id', userId);
    } catch (e) {
      rethrow;
    }
  }
  
  // Update member role
  Future<void> updateMemberRole(String groupId, String userId, String newRole) async {
    try {
      await _client
          .from(SupabaseService.groupMembersTable)
          .update({'role': newRole})
          .eq('group_id', groupId)
          .eq('user_id', userId);
    } catch (e) {
      rethrow;
    }
  }
  
  // Get group members
  Future<List<GroupMember>> getGroupMembers(String groupId) async {
    try {
      final response = await _client
          .from(SupabaseService.groupMembersTable)
          .select()
          .eq('group_id', groupId)
          .eq('is_active', true)
          .order('joined_at', ascending: true);
      
      return response.map<GroupMember>((json) => GroupMember.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Send group message
  Future<GroupMessage> sendGroupMessage(GroupMessage message) async {
    try {
      final response = await _client
          .from(SupabaseService.groupMessagesTable)
          .insert(message.toJson())
          .select()
          .single();
      
      return GroupMessage.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Get group messages
  Future<List<GroupMessage>> getGroupMessages(
    String groupId, {
    int? limit = 50,
    int? offset = 0,
  }) async {
    try {
      var query = _client
          .from(SupabaseService.groupMessagesTable)
          .select()
          .eq('group_id', groupId);
      
      if (limit != null) {
        query = query.limit(limit);
      }
      
      if (offset != null) {
        query = query.range(offset, offset + (limit ?? 50) - 1);
      }
      
      query = query.order('created_at', ascending: false);
      
      final response = await query;
      
      return response.map<GroupMessage>((json) => GroupMessage.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Subscribe to group messages for real-time chat
  Stream<List<GroupMessage>> subscribeToGroupMessages(String groupId) {
    return _client
        .from(SupabaseService.groupMessagesTable)
        .stream(primaryKey: ['id'])
        .eq('group_id', groupId)
        .order('created_at', ascending: true)
        .map((data) => data.map<GroupMessage>((json) => GroupMessage.fromJson(json)).toList());
  }
  
  // Update group message
  Future<GroupMessage> updateGroupMessage(String messageId, String newContent) async {
    try {
      final response = await _client
          .from(SupabaseService.groupMessagesTable)
          .update({
            'content': newContent,
            'is_edited': true,
            'edited_at': DateTime.now().toIso8601String(),
          })
          .eq('id', messageId)
          .select()
          .single();
      
      return GroupMessage.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Delete group message
  Future<void> deleteGroupMessage(String messageId) async {
    try {
      await _client
          .from(SupabaseService.groupMessagesTable)
          .delete()
          .eq('id', messageId);
    } catch (e) {
      rethrow;
    }
  }
  
  // Send group invite
  Future<GroupInvite> sendGroupInvite(GroupInvite invite) async {
    try {
      final response = await _client
          .from(SupabaseService.groupInvitesTable)
          .insert(invite.toJson())
          .select()
          .single();
      
      return GroupInvite.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Get user's group invites
  Future<List<GroupInvite>> getUserGroupInvites(String userId) async {
    try {
      final response = await _client
          .from(SupabaseService.groupInvitesTable)
          .select()
          .eq('invitee_id', userId)
          .eq('status', 'pending')
          .order('created_at', ascending: false);
      
      return response.map<GroupInvite>((json) => GroupInvite.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Respond to group invite
  Future<GroupInvite> respondToGroupInvite(String inviteId, String response) async {
    try {
      final invite = await _client
          .from(SupabaseService.groupInvitesTable)
          .update({
            'status': response, // 'accepted' or 'declined'
            'responded_at': DateTime.now().toIso8601String(),
          })
          .eq('id', inviteId)
          .select()
          .single();
      
      // If accepted, add user to group
      if (response == 'accepted') {
        await addGroupMember(
          invite['group_id'],
          GroupMember(
            userId: invite['invitee_id'],
            userName: 'New Member', // Should be fetched from user data
            role: 'member',
            joinedAt: DateTime.now(),
          ),
        );
      }
      
      return GroupInvite.fromJson(invite);
    } catch (e) {
      rethrow;
    }
  }
  
  // Check if user is group member
  Future<bool> isGroupMember(String groupId, String userId) async {
    try {
      final response = await _client
          .from(SupabaseService.groupMembersTable)
          .select('id')
          .eq('group_id', groupId)
          .eq('user_id', userId)
          .eq('is_active', true);
      
      return response.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
  
  // Upload group avatar
  Future<String> uploadGroupAvatar(String groupId, List<int> imageBytes) async {
    try {
      final fileName = '$groupId/avatar_${DateTime.now().millisecondsSinceEpoch}';
      
      await _client.storage
          .from(SupabaseService.groupAvatarsBucket)
          .uploadBinary(fileName, imageBytes);
      
      return _client.storage
          .from(SupabaseService.groupAvatarsBucket)
          .getPublicUrl(fileName);
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
GroupRepository groupRepository(GroupRepositoryRef ref) {
  final client = ref.read(supabaseClientProvider);
  return GroupRepository(client);
} 