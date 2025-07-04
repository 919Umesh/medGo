// lib/src/auth/model/signup_model.dart
class SignUpModel {
  final String? userId;
  final String? email;
  final bool requiresConfirmation;
  final String? error;

  SignUpModel({
    this.userId,
    this.email,
    this.requiresConfirmation = false,
    this.error,
  });

  @override
  String toString() =>
      'SignUpModel(userId: $userId, email: $email, requiresConfirmation: $requiresConfirmation, error: $error)';
}
