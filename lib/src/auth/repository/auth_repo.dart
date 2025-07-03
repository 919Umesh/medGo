import 'package:project_bloc/core/services/api/api_helper.dart';
import 'package:project_bloc/src/auth/model/auth_model.dart';

class AuthRepository {
  final APIProvider _apiProvider;

  AuthRepository() : _apiProvider = apiProvider;

  Future<AuthModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiProvider.supabase.authSignInWithPassword(
        email: email,
        password: password,
      );

      return AuthModel(
        userId: response['userId'],
        email: response['email'],
      );
    } catch (e) {
      throw Exception('Failed to authenticate: $e');
    }
  }
}
