import 'package:project_bloc/src/auth/model/auth_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  Future<AuthModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception('Authentication failed - no user returned');
      }

      return AuthModel(
        userId: response.user!.id,
        email: response.user!.email,
      );
    } on AuthException catch (e) {
      throw Exception('Auth error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to authenticate: $e');
    }
  }
}
