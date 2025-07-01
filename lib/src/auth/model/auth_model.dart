class AuthModel {
  final String? userId;
  final String? email;
  final String? error;

  AuthModel({
    this.userId,
    this.email,
    this.error,
  });

  @override
  String toString() =>
      'AuthModel(userId: $userId, email: $email, error: $error)';
}
