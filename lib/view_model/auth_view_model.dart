import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:sabrina2025/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthViewModel with ChangeNotifier {
  final AuthService _authService = AuthService();

  // Sign up method
  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final error = await _authService.signUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    if (error != null) {
      // Display error message
      _showToast(error, isError: true);
    } else {
      // Display success message
      _showToast(
          'Sign-up successful! Please check your email to verify your account.');
    }
  }

  // Sign in method
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final error = await _authService.signIn(
      email: email,
      password: password,
    );

    if (error != null) {
      // Display error message
      _showToast(error, isError: true);
    } else {
      // Display success message
      _showToast('Sign-in successful!');
    }
  }

  // Sign out method
  Future<void> signOut() async {
    await _authService.signOut();
    _showToast('Sign-out successful!');
  }

  // Current user getter
  User? get currentUser => _authService.currentUser;

  // Toast helper function
  void _showToast(String message, {bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
