import 'dart:typed_data';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/court_model.dart';
import '../../core/services/supabase_service.dart';

part 'court_repository.g.dart';

class CourtRepository {
  final SupabaseClient _client;
  
  CourtRepository(this._client);
  
  // Get all courts with optional filters
  Future<List<CourtModel>> getCourts({
    String? sportType,
    double? maxDistance,
    double? lat,
    double? lng,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    int? limit = 20,
    int? offset = 0,
  }) async {
    try {
      var query = _client.from(SupabaseService.courtsTable).select();
      
      // Apply filters
      if (sportType != null) {
        query = query.contains('sport_types', [sportType]);
      }
      
      if (minPrice != null) {
        query = query.gte('price_per_hour', minPrice);
      }
      
      if (maxPrice != null) {
        query = query.lte('price_per_hour', maxPrice);
      }
      
      if (minRating != null) {
        query = query.gte('rating', minRating);
      }
      
      query = query.eq('status', 'active');
      
      if (limit != null) {
        query = query.limit(limit);
      }
      
      if (offset != null) {
        query = query.range(offset, offset + (limit ?? 20) - 1);
      }
      
      final response = await query;
      
      return response.map<CourtModel>((json) => CourtModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Get court by ID
  Future<CourtModel?> getCourtById(String courtId) async {
    try {
      final response = await _client
          .from(SupabaseService.courtsTable)
          .select()
          .eq('id', courtId)
          .eq('status', 'active')
          .single();
      
      return CourtModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }
  
  // Search courts by name or location
  Future<List<CourtModel>> searchCourts(String query) async {
    try {
      final response = await _client
          .from(SupabaseService.courtsTable)
          .select()
          .or('name.ilike.%$query%,location.ilike.%$query%,description.ilike.%$query%')
          .eq('status', 'active')
          .limit(20);
      
      return response.map<CourtModel>((json) => CourtModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Get courts by owner
  Future<List<CourtModel>> getCourtsByOwner(String ownerId) async {
    try {
      final response = await _client
          .from(SupabaseService.courtsTable)
          .select()
          .eq('owner_id', ownerId)
          .order('created_at', ascending: false);
      
      return response.map<CourtModel>((json) => CourtModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Create new court
  Future<CourtModel> createCourt(CourtModel court) async {
    try {
      final response = await _client
          .from(SupabaseService.courtsTable)
          .insert(court.toJson())
          .select()
          .single();
      
      return CourtModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Update court
  Future<CourtModel> updateCourt(CourtModel court) async {
    try {
      final response = await _client
          .from(SupabaseService.courtsTable)
          .update(court.copyWith(updatedAt: DateTime.now()).toJson())
          .eq('id', court.id)
          .select()
          .single();
      
      return CourtModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Delete court (soft delete by setting status to inactive)
  Future<void> deleteCourt(String courtId) async {
    try {
      await _client
          .from(SupabaseService.courtsTable)
          .update({
            'status': 'inactive',
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', courtId);
    } catch (e) {
      rethrow;
    }
  }
  
  // Get court reviews
  Future<List<CourtReview>> getCourtReviews(String courtId) async {
    try {
      final response = await _client
          .from(SupabaseService.courtReviewsTable)
          .select()
          .eq('court_id', courtId)
          .order('created_at', ascending: false);
      
      return response.map<CourtReview>((json) => CourtReview.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
  // Add court review
  Future<CourtReview> addCourtReview(CourtReview review) async {
    try {
      final response = await _client
          .from(SupabaseService.courtReviewsTable)
          .insert(review.toJson())
          .select()
          .single();
      
      // Update court rating
      await _updateCourtRating(review.courtId);
      
      return CourtReview.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Update court rating based on reviews
  Future<void> _updateCourtRating(String courtId) async {
    try {
      final reviews = await getCourtReviews(courtId);
      if (reviews.isNotEmpty) {
        final averageRating = reviews.map((r) => r.rating).reduce((a, b) => a + b) / reviews.length;
        
        await _client
            .from(SupabaseService.courtsTable)
            .update({
              'rating': averageRating,
              'total_reviews': reviews.length,
              'updated_at': DateTime.now().toIso8601String(),
            })
            .eq('id', courtId);
      }
    } catch (e) {
      // Handle error silently for this background operation
    }
  }
  
  // Upload court images
  Future<String> uploadCourtImage(String courtId, List<int> imageBytes, String fileName) async {
    try {
      final filePath = '$courtId/${DateTime.now().millisecondsSinceEpoch}_$fileName';
      
      await _client.storage
          .from(SupabaseService.courtImagesBucket)
          .uploadBinary(filePath, Uint8List.fromList(imageBytes));
      
      return _client.storage
          .from(SupabaseService.courtImagesBucket)
          .getPublicUrl(filePath);
    } catch (e) {
      rethrow;
    }
  }
  
  // Get nearby courts using geographical distance
  Future<List<CourtModel>> getNearbyCourtsByDistance({
    required double latitude,
    required double longitude,
    double radiusKm = 10.0,
    int limit = 20,
  }) async {
    try {
      // Using PostGIS functions (if available) or simple distance calculation
      final response = await _client.rpc('get_nearby_courts', params: {
        'lat': latitude,
        'lng': longitude,
        'radius_km': radiusKm,
        'row_limit': limit,
      });
      
      return response.map<CourtModel>((json) => CourtModel.fromJson(json)).toList();
    } catch (e) {
      // Fallback to basic filtering if RPC function doesn't exist
      return getCourts(lat: latitude, lng: longitude, limit: limit);
    }
  }
  
  // Get popular courts (highest rated or most booked)
  Future<List<CourtModel>> getPopularCourts({int limit = 10}) async {
    try {
      final response = await _client
          .from(SupabaseService.courtsTable)
          .select()
          .eq('status', 'active')
          .gte('rating', 4.0)
          .order('rating', ascending: false)
          .order('total_reviews', ascending: false)
          .limit(limit);
      
      return response.map<CourtModel>((json) => CourtModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
CourtRepository courtRepository(CourtRepositoryRef ref) {
  final client = ref.read(supabaseClientProvider);
  return CourtRepository(client);
} 