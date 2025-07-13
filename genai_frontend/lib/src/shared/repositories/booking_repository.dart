import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/booking_model.dart';
import '../../core/services/supabase_service.dart';

part 'booking_repository.g.dart';

class BookingRepository {
  final SupabaseClient _client;
  
  BookingRepository(this._client);
  
  // Create new booking
  Future<BookingModel> createBooking(BookingModel booking) async {
    try {
      // Check availability first
      final isAvailable = await checkAvailability(
        booking.courtId,
        booking.bookingDate,
        booking.startTime,
        booking.endTime,
      );
      
      if (!isAvailable) {
        throw Exception('Court is not available for the selected time slot');
      }
      
      final response = await _client
          .from(SupabaseService.bookingsTable)
          .insert(booking.toJson())
          .select()
          .single();
      
      return BookingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Get booking by ID
  Future<BookingModel?> getBookingById(String bookingId) async {
    try {
      final response = await _client
          .from(SupabaseService.bookingsTable)
          .select('*, courts(name)')
          .eq('id', bookingId)
          .single();
      
      return BookingModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }
  
  // Get user bookings with filtering and pagination
  Future<List<BookingModel>> getUserBookings(
    String userId, {
    BookingStatus? status,
    int? limit,
    int? offset,
  }) async {
    try {
      var queryBuilder = _client
          .from(SupabaseService.bookingsTable)
          .select()
          .eq('user_id', userId);
      
      if (status != null) {
        queryBuilder = queryBuilder.eq('status', status.toString().split('.').last);
      }
      
      // Chain operations directly to avoid type issues
      final List<dynamic> response;
      if (limit != null && offset != null) {
        response = await queryBuilder
            .order('created_at', ascending: false)
            .range(offset, offset + limit - 1);
      } else if (limit != null) {
        response = await queryBuilder
            .order('created_at', ascending: false)
            .limit(limit);
      } else {
        response = await queryBuilder
            .order('created_at', ascending: false);
      }
      
      return response
          .map((json) => BookingModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to get user bookings: $e');
    }
  }
  
  // Get court bookings for date range
  Future<List<BookingModel>> getCourtBookings(
    String courtId, {
    DateTime? startDate,
    DateTime? endDate,
    String? status,
  }) async {
    try {
      var queryBuilder = _client
          .from(SupabaseService.bookingsTable)
          .select('*, users(name, avatar_url)')
          .eq('court_id', courtId);
      
      if (startDate != null) {
        queryBuilder = queryBuilder.gte('booking_date', startDate.toIso8601String());
      }
      
      if (endDate != null) {
        queryBuilder = queryBuilder.lte('booking_date', endDate.toIso8601String());
      }
      
      if (status != null) {
        queryBuilder = queryBuilder.eq('status', status);
      }
      
      // Chain operations directly
      final response = await queryBuilder
          .order('booking_date', ascending: true);
      
      return (response as List<dynamic>)
          .map((json) => BookingModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to get court bookings: $e');
    }
  }
  
  // Update booking
  Future<BookingModel> updateBooking(BookingModel booking) async {
    try {
      final response = await _client
          .from(SupabaseService.bookingsTable)
          .update(booking.copyWith(updatedAt: DateTime.now()).toJson())
          .eq('id', booking.id)
          .select()
          .single();
      
      return BookingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Cancel booking
  Future<BookingModel> cancelBooking(String bookingId, String cancellationReason) async {
    try {
      final response = await _client
          .from(SupabaseService.bookingsTable)
          .update({
            'status': 'cancelled',
            'cancellation_reason': cancellationReason,
            'cancellation_date': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', bookingId)
          .select()
          .single();
      
      return BookingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Confirm booking
  Future<BookingModel> confirmBooking(String bookingId) async {
    try {
      final response = await _client
          .from(SupabaseService.bookingsTable)
          .update({
            'status': 'confirmed',
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', bookingId)
          .select()
          .single();
      
      return BookingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Complete booking
  Future<BookingModel> completeBooking(String bookingId) async {
    try {
      final response = await _client
          .from(SupabaseService.bookingsTable)
          .update({
            'status': 'completed',
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', bookingId)
          .select()
          .single();
      
      return BookingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Check court availability
  Future<bool> checkAvailability(
    String courtId,
    DateTime date,
    String startTime,
    String endTime,
  ) async {
    try {
      final response = await _client
          .from(SupabaseService.bookingsTable)
          .select('id')
          .eq('court_id', courtId)
          .eq('booking_date', date.toIso8601String().split('T')[0])
          .neq('status', 'cancelled')
          .overlaps('time_range', '[$startTime,$endTime)');
      
      return response.isEmpty;
    } catch (e) {
      // Fallback method if overlaps doesn't work
      final response = await _client
          .from(SupabaseService.bookingsTable)
          .select('start_time, end_time')
          .eq('court_id', courtId)
          .eq('booking_date', date.toIso8601String().split('T')[0])
          .neq('status', 'cancelled');
      
      // Check for time conflicts manually
      for (final booking in response) {
        final existingStart = booking['start_time'] as String;
        final existingEnd = booking['end_time'] as String;
        
        if (_timeOverlaps(startTime, endTime, existingStart, existingEnd)) {
          return false;
        }
      }
      
      return true;
    }
  }
  
  // Helper method to check time overlap
  bool _timeOverlaps(String start1, String end1, String start2, String end2) {
    final start1Minutes = _timeToMinutes(start1);
    final end1Minutes = _timeToMinutes(end1);
    final start2Minutes = _timeToMinutes(start2);
    final end2Minutes = _timeToMinutes(end2);
    
    return start1Minutes < end2Minutes && end1Minutes > start2Minutes;
  }
  
  // Helper method to convert time string to minutes
  int _timeToMinutes(String time) {
    final parts = time.split(':');
    return int.parse(parts[0]) * 60 + int.parse(parts[1]);
  }
  
  // Get available time slots for a court on a specific date
  Future<List<String>> getAvailableTimeSlots(
    String courtId,
    DateTime date,
  ) async {
    try {
      // Get court schedule for the day
      final court = await _client
          .from(SupabaseService.courtsTable)
          .select('schedules')
          .eq('id', courtId)
          .single();
      
      // Get existing bookings for the date
      final bookings = await getCourtBookings(
        courtId,
        startDate: date,
        endDate: date,
      );
      
      // Generate available slots based on court schedule and existing bookings
      // This is a simplified version - you might want to implement more complex logic
      final allSlots = <String>[];
      for (int hour = 8; hour <= 22; hour++) {
        allSlots.add('${hour.toString().padLeft(2, '0')}:00');
      }
      
      // Remove booked slots
      for (final booking in bookings) {
        if (booking.status != 'cancelled') {
          allSlots.remove(booking.startTime);
        }
      }
      
      return allSlots;
    } catch (e) {
      rethrow;
    }
  }
  
  // Get booking statistics for a user
  Future<BookingStats> getUserBookingStats(String userId) async {
    try {
      final bookings = await getUserBookings(userId);
      
      final totalBookings = bookings.length;
      final completedBookings = bookings.where((b) => b.status == 'completed').length;
      final cancelledBookings = bookings.where((b) => b.status == 'cancelled').length;
      final totalSpent = bookings
          .where((b) => b.status == 'completed')
          .fold(0.0, (sum, b) => sum + b.totalPrice);
      
      final favoriteCourts = <String>[];
      final courtCounts = <String, int>{};
      
      for (final booking in bookings.where((b) => b.status == 'completed')) {
        courtCounts[booking.courtId] = (courtCounts[booking.courtId] ?? 0) + 1;
      }
      
      final sortedCourts = courtCounts.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      favoriteCourts.addAll(sortedCourts.take(5).map((e) => e.key));
      
      return BookingStats(
        totalBookings: totalBookings,
        completedBookings: completedBookings,
        cancelledBookings: cancelledBookings,
        totalSpent: totalSpent,
        favoriteCourts: favoriteCourts,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  // Get upcoming bookings for a user
  Future<List<BookingModel>> getUpcomingBookings(String userId) async {
    try {
      final now = DateTime.now();
      final response = await _client
          .from(SupabaseService.bookingsTable)
          .select('*, courts(name)')
          .eq('user_id', userId)
          .gte('booking_date', now.toIso8601String().split('T')[0])
          .neq('status', 'cancelled')
          .neq('status', 'completed')
          .order('booking_date', ascending: true)
          .order('start_time', ascending: true)
          .limit(10);
      
      return response.map<BookingModel>((json) => BookingModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Update payment status
  Future<BookingModel> updatePaymentStatus(String bookingId, String paymentStatus) async {
    try {
      final response = await _client
          .from(SupabaseService.bookingsTable)
          .update({
            'payment_status': paymentStatus,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', bookingId)
          .select()
          .single();
      
      return BookingModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
BookingRepository bookingRepository(BookingRepositoryRef ref) {
  final client = ref.read(supabaseClientProvider);
  return BookingRepository(client);
} 