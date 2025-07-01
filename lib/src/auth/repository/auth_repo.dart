import 'package:project_bloc/src/auth/model/auth_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabaseClient;

  AuthRepository(this._supabaseClient);

  Future<AuthModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return AuthModel(
        userId: response.user?.id,
        email: response.user?.email,
      );
    } on AuthException catch (e) {
      return AuthModel(error: e.message);
    } catch (e) {
      return AuthModel(error: e.toString());
    }
  }
}
