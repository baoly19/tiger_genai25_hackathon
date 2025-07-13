import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/event_model.dart';
import '../../core/services/supabase_service.dart';

part 'event_repository.g.dart';

class EventRepository {
  final SupabaseClient _client;
  
  EventRepository(this._client);
  
  // Create new event
  Future<EventModel> createEvent(EventModel event) async {
    try {
      final response = await _client
          .from(SupabaseService.eventsTable)
          .insert(event.toJson())
          .select()
          .single();
      
      return EventModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Get event by ID
  Future<EventModel?> getEventById(String eventId) async {
    try {
      final response = await _client
          .from(SupabaseService.eventsTable)
          .select('''
            *,
            event_participants(
              user_id,
              user_name,
              user_avatar_url,
              registered_at,
              status,
              notes
            )
          ''')
          .eq('id', eventId)
          .single();
      
      return EventModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }
  
  // Get all events with filters
  Future<List<EventModel>> getEvents({
    String? sportType,
    String? location,
    String? status = 'upcoming',
    DateTime? startDate,
    DateTime? endDate,
    int? limit = 20,
    int? offset = 0,
  }) async {
    try {
      var query = _client
          .from(SupabaseService.eventsTable)
          .select('''
            *,
            event_participants(count)
          ''');
      
      if (sportType != null) {
        query = query.contains('sport_types', [sportType]);
      }
      
      if (location != null) {
        query = query.ilike('location', '%$location%');
      }
      
      if (status != null) {
        query = query.eq('status', status);
      }
      
      if (startDate != null) {
        query = query.gte('start_time', startDate.toIso8601String());
      }
      
      if (endDate != null) {
        query = query.lte('end_time', endDate.toIso8601String());
      }
      
      if (limit != null) {
        query = query.limit(limit);
      }
      
      if (offset != null) {
        query = query.range(offset, offset + (limit ?? 20) - 1);
      }
      
      query = query.order('start_time', ascending: true);
      
      final response = await query;
      
      return response.map<EventModel>((json) => EventModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Search events
  Future<List<EventModel>> searchEvents(String searchQuery) async {
    try {
      final response = await _client
          .from(SupabaseService.eventsTable)
          .select('''
            *,
            event_participants(count)
          ''')
          .or('title.ilike.%$searchQuery%,description.ilike.%$searchQuery%,location.ilike.%$searchQuery%')
          .eq('status', 'upcoming')
          .limit(20);
      
      return response.map<EventModel>((json) => EventModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Get user's events (organized)
  Future<List<EventModel>> getUserEvents(String organizerId) async {
    try {
      final response = await _client
          .from(SupabaseService.eventsTable)
          .select('''
            *,
            event_participants(count)
          ''')
          .eq('organizer_id', organizerId)
          .order('created_at', ascending: false);
      
      return response.map<EventModel>((json) => EventModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Get user's registered events
  Future<List<EventModel>> getUserRegisteredEvents(String userId) async {
    try {
      final response = await _client
          .from(SupabaseService.eventParticipantsTable)
          .select('''
            events(
              *,
              event_participants(count)
            )
          ''')
          .eq('user_id', userId)
          .eq('status', 'registered');
      
      return response
          .map<EventModel>((json) => EventModel.fromJson(json['events']))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Update event
  Future<EventModel> updateEvent(EventModel event) async {
    try {
      final response = await _client
          .from(SupabaseService.eventsTable)
          .update(event.copyWith(updatedAt: DateTime.now()).toJson())
          .eq('id', event.id)
          .select()
          .single();
      
      return EventModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Delete event (soft delete)
  Future<void> deleteEvent(String eventId) async {
    try {
      await _client
          .from(SupabaseService.eventsTable)
          .update({
            'status': 'cancelled',
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', eventId);
    } catch (e) {
      rethrow;
    }
  }
  
  // Register for event
  Future<EventParticipant> registerForEvent(String eventId, EventParticipant participant) async {
    try {
      // Check if event is full
      final event = await getEventById(eventId);
      if (event == null) {
        throw Exception('Event not found');
      }
      
      if (event.participants.length >= event.maxParticipants && event.maxParticipants > 0) {
        throw Exception('Event is full');
      }
      
      // Check if user is already registered
      final existingRegistration = await _client
          .from(SupabaseService.eventParticipantsTable)
          .select()
          .eq('event_id', eventId)
          .eq('user_id', participant.userId);
      
      if (existingRegistration.isNotEmpty) {
        throw Exception('User already registered for this event');
      }
      
      final response = await _client
          .from(SupabaseService.eventParticipantsTable)
          .insert({
            'event_id': eventId,
            'user_id': participant.userId,
            'user_name': participant.userName,
            'user_avatar_url': participant.userAvatarUrl,
            'registered_at': (participant.registeredAt).toIso8601String(),
            'status': participant.status,
            'notes': participant.notes,
          })
          .select()
          .single();
      
      return EventParticipant.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Unregister from event
  Future<void> unregisterFromEvent(String eventId, String userId) async {
    try {
      await _client
          .from(SupabaseService.eventParticipantsTable)
          .update({'status': 'cancelled'})
          .eq('event_id', eventId)
          .eq('user_id', userId);
    } catch (e) {
      rethrow;
    }
  }
  
  // Get event participants
  Future<List<EventParticipant>> getEventParticipants(String eventId) async {
    try {
      final response = await _client
          .from(SupabaseService.eventParticipantsTable)
          .select()
          .eq('event_id', eventId)
          .neq('status', 'cancelled')
          .order('registered_at', ascending: true);
      
      return response.map<EventParticipant>((json) => EventParticipant.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Update participant status
  Future<EventParticipant> updateParticipantStatus(
    String eventId,
    String userId,
    String newStatus,
  ) async {
    try {
      final response = await _client
          .from(SupabaseService.eventParticipantsTable)
          .update({'status': newStatus})
          .eq('event_id', eventId)
          .eq('user_id', userId)
          .select()
          .single();
      
      return EventParticipant.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Get upcoming events
  Future<List<EventModel>> getUpcomingEvents({int limit = 10}) async {
    try {
      final now = DateTime.now();
      final response = await _client
          .from(SupabaseService.eventsTable)
          .select('''
            *,
            event_participants(count)
          ''')
          .gte('start_time', now.toIso8601String())
          .eq('status', 'upcoming')
          .eq('registration_status', 'open')
          .order('start_time', ascending: true)
          .limit(limit);
      
      return response.map<EventModel>((json) => EventModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Get popular events
  Future<List<EventModel>> getPopularEvents({int limit = 10}) async {
    try {
      final response = await _client
          .from(SupabaseService.eventsTable)
          .select('''
            *,
            event_participants(count)
          ''')
          .eq('status', 'upcoming')
          .eq('registration_status', 'open')
          .order('participant_count', ascending: false)
          .limit(limit);
      
      return response.map<EventModel>((json) => EventModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Check if user is registered for event
  Future<bool> isUserRegistered(String eventId, String userId) async {
    try {
      final response = await _client
          .from(SupabaseService.eventParticipantsTable)
          .select('id')
          .eq('event_id', eventId)
          .eq('user_id', userId)
          .neq('status', 'cancelled');
      
      return response.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
  
  // Upload event images
  Future<String> uploadEventImage(String eventId, List<int> imageBytes, String fileName) async {
    try {
      final filePath = '$eventId/${DateTime.now().millisecondsSinceEpoch}_$fileName';
      
      await _client.storage
          .from(SupabaseService.eventImagesBucket)
          .uploadBinary(filePath, imageBytes);
      
      return _client.storage
          .from(SupabaseService.eventImagesBucket)
          .getPublicUrl(filePath);
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
EventRepository eventRepository(EventRepositoryRef ref) {
  final client = ref.read(supabaseClientProvider);
  return EventRepository(client);
} 