import 'package:project_bloc/core/services/supabase/supabase_helper.dart';
import 'package:project_bloc/src/auth/model/auth_model.dart';

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
}
