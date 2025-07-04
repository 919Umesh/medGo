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

      return SignUpModel(
        userId: response['userId'],
        email: response['email'],
        requiresConfirmation: response['requiresConfirmation'] ?? false,
      );
    } catch (e) {
      return SignUpModel(error: e.toString());
    }
  }
}
