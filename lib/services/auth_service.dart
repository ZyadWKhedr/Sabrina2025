import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  Future<String?> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      // Attempt to sign up the user
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'first_name': firstName,
          'last_name': lastName,
        },
      );

      // Check if a user is returned
      if (response.user != null) {
        return null; // Signup successful, return null (no error)
      }

      // If the user is null, something unexpected happened
      return 'An unknown error occurred during sign-up.';
    } on AuthException catch (e) {
      // Handle Supabase authentication-specific errors
      return e.message;
    } catch (e) {
      // Handle other errors
      return 'An unexpected error occurred: $e';
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // Attempt to sign in the user
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      // Check if a session is returned
      if (response.session != null) {
        return null; // Sign-in successful, return null (no error)
      }

      // If no session, something unexpected happened
      return 'An unknown error occurred during sign-in.';
    } on AuthException catch (e) {
      // Handle Supabase authentication-specific errors
      return e.message;
    } catch (e) {
      // Handle other unexpected errors
      return 'An unexpected error occurred: $e';
    }
  }
  
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  User? get currentUser => _supabase.auth.currentUser;
}

