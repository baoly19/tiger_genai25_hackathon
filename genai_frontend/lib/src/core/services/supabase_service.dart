import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/supabase_config.dart';

part 'supabase_service.g.dart';

class SupabaseService {
  static const String _supabaseUrl = 'https://fhutuvsluxrsjxygbjdg.supabase.co';
  static const String _supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZodXR1dnNsdXhyc2p4eWdiamRnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIyMDc1OTcsImV4cCI6MjA2Nzc4MzU5N30.pjx7Mvt8GqxxH5RbPymVbTSzQcov3VvgNmqxCU9_DPM';



  static SupabaseClient get client => Supabase.instance.client;
  
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseAnonKey,
      debug: true, // Set to false in production
    );
  }
  
  // Database table names
  static const String usersTable = 'users';
  static const String courtsTable = 'courts';
  static const String bookingsTable = 'bookings';
  static const String activitiesTable = 'activities';
  static const String groupsTable = 'groups';
  static const String groupMembersTable = 'group_members';
  static const String groupMessagesTable = 'group_messages';
  static const String groupInvitesTable = 'group_invites';
  static const String eventsTable = 'events';
  static const String eventParticipantsTable = 'event_participants';
  static const String courtReviewsTable = 'court_reviews';
  static const String notificationsTable = 'notifications';
  
  // Storage buckets
  static const String avatarsBucket = 'avatars';
  static const String courtImagesBucket = 'court-images';
  static const String eventImagesBucket = 'event-images';
  static const String groupAvatarsBucket = 'group-avatars';
}

@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  return SupabaseService.client;
} 