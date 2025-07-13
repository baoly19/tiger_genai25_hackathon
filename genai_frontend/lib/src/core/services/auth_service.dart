import 'dart:typed_data';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../shared/models/user_model.dart';
import 'supabase_service.dart';


part 'auth_service.g.dart';

class AuthService {
  final SupabaseClient _client;
  
  AuthService(this._client);
  
  // Get current user session
  User? get currentUser => _client.auth.currentUser;
  
  // Get auth state stream
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
  
  // Sign up with email and password
  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'avatar_url': null,
        },
      );
      
      if (response.user != null) {
        // Create user profile in database
        await _createUserProfile(response.user!, name);
      }
      
      return response;
    } catch (e) {
      rethrow;
    }
  }
  
  // Sign in with email and password
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  
  
  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _client.auth.resetPasswordForEmail(
        email,
        redirectTo: 'com.sportex.app://reset-password',
      );
    } catch (e) {
      rethrow;
    }
  }
  
  // Update password
  Future<UserResponse> updatePassword(String newPassword) async {
    try {
      return await _client.auth.updateUser(
        UserAttributes(password: newPassword),
      );
    } catch (e) {
      rethrow;
    }
  }
  
  // Sign out
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
  
  // Delete account
  Future<void> deleteAccount() async {
    try {
      final user = currentUser;
      if (user != null) {
        // Delete user data from database
        await _client.from(SupabaseService.usersTable).delete().eq('id', user.id);
        // Note: User deletion from auth might need admin privileges
      }
    } catch (e) {
      rethrow;
    }
  }
  
  // Resend email confirmation
  Future<ResendResponse> resendEmailConfirmation(String email) async {
    try {
      return await _client.auth.resend(
        type: OtpType.signup,
        email: email,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  // Create user profile in database
  Future<void> _createUserProfile(User user, String name) async {
    final userModel = UserModel(
      id: user.id,
      email: user.email!,
      name: name,
      avatarUrl: user.userMetadata?['avatar_url'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    await _client.from(SupabaseService.usersTable).insert(userModel.toJson());
  }
  
  // Get user profile from database
  Future<UserModel?> getUserProfile([String? userId]) async {
    try {
      final uid = userId ?? currentUser?.id;
      if (uid == null) return null;
      
      final response = await _client
          .from(SupabaseService.usersTable)
          .select()
          .eq('id', uid)
          .single();
      
      return UserModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }
  
  // Update user profile
  Future<UserModel> updateUserProfile(UserModel updatedUser) async {
    try {
      final response = await _client
          .from(SupabaseService.usersTable)
          .update(updatedUser.toJson())
          .eq('id', updatedUser.id)
          .select()
          .single();
      
      return UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  // Upload avatar
  Future<String> uploadAvatar(String filePath, List<int> fileBytes) async {
    try {
      final user = currentUser;
      if (user == null) throw Exception('User not authenticated');
      
      final fileName = '${user.id}/avatar_${DateTime.now().millisecondsSinceEpoch}';
      
      await _client.storage
          .from(SupabaseService.avatarsBucket)
          .uploadBinary(fileName, Uint8List.fromList(fileBytes));
      
      return _client.storage
          .from(SupabaseService.avatarsBucket)
          .getPublicUrl(fileName);
    } catch (e) {
      rethrow;
    }
  }
}

// Simple in-memory auth state for development
class SimpleAuthState {
  static User? _currentUser;
  static String? _userEmail;
  static String? _userName;
  
  static User? get currentUser => _currentUser;
  
  static void signIn(String email, String password, {String? name}) {
    _userEmail = email;
    _userName = name ?? email.split('@')[0]; // Use email prefix if no name provided
    
    _currentUser = User(
      id: 'user-${DateTime.now().millisecondsSinceEpoch}',
      appMetadata: {},
      userMetadata: {
        'name': _userName,
        'email': _userEmail,
      },
      aud: 'authenticated',
      createdAt: DateTime.now().toIso8601String(),
      email: _userEmail,
    );
  }
  
  static void signUp(String email, String password, String name) {
    _userEmail = email;
    _userName = name;
    
    _currentUser = User(
      id: 'user-${DateTime.now().millisecondsSinceEpoch}',
      appMetadata: {},
      userMetadata: {
        'name': _userName,
        'email': _userEmail,
      },
      aud: 'authenticated',
      createdAt: DateTime.now().toIso8601String(),
      email: _userEmail,
    );
  }
  
  static void signOut() {
    _currentUser = null;
    _userEmail = null;
    _userName = null;
  }
}

@riverpod
AuthService authService(AuthServiceRef ref) {
  final client = ref.read(supabaseClientProvider);
  return AuthService(client);
}

@riverpod
Stream<AuthState> authStateChanges(AuthStateChangesRef ref) {
  final authService = ref.read(authServiceProvider);
  return authService.authStateChanges;
}

@riverpod
Stream<User?> authState(AuthStateRef ref) {
  final authService = ref.read(authServiceProvider);
  return authService.authStateChanges.map((state) => state.session?.user);
}

// Mock provider for development/testing - now uses real user data
@riverpod
Stream<User?> mockAuthState(MockAuthStateRef ref) {
  // Return the current user from our simple auth state
  return Stream.value(SimpleAuthState.currentUser);
}

@riverpod
User? currentUser(CurrentUserRef ref) {
  final authService = ref.read(authServiceProvider);
  return authService.currentUser;
} 