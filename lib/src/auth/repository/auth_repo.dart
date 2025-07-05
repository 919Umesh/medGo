import 'package:flutter/material.dart';
import 'package:project_bloc/core/services/supabase/supabase_helper.dart';
import 'package:project_bloc/src/auth/model/auth_model.dart';
import 'package:project_bloc/src/auth/model/signup_model.dart';

class AuthRepository {
  Future<AuthModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await SupabaseHelper.signInWithPassword(
      email: email,
      password: password,
    );
    return AuthModel(
      userId: response['userId'],
      email: response['email'],
    );
  }

  Future<SignUpModel> signUpWithEmail({
    required String email,
    required String password,
    Map<String, dynamic>? userMetadata,
  }) async {
    try {
      final response = await SupabaseHelper.signUpWithEmail(
        email: email,
        password: password,
        userMetadata: userMetadata,
      );

      debugPrint('${response['requiresConfirmation']}');
      return SignUpModel(
        email: response['email'],
        requiresConfirmation: response['requiresConfirmation'] ?? false,
      );
    } catch (e) {
      return SignUpModel(error: e.toString());
    }
  }

  Future<AuthModel> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await SupabaseHelper.verifyOtp(
        email: email,
        otp: otp,
      );
      return AuthModel(
        userId: response['userId'],
        email: response['email'],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> resendConfirmationEmail(String email) async {
    await SupabaseHelper.resendConfirmationEmail(email);
  }
}
