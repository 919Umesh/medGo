part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String message;
  final String userId;
  final String? email;

  const Authenticated({
    required this.message,
    required this.userId,
    this.email,
  });

  @override
  List<Object?> get props => [message, userId, email];
}

class RegistrationPending extends AuthState {
  final String email;
  final String message;

  const RegistrationPending({
    required this.email,
    required this.message,
  });

  @override
  List<Object?> get props => [email, message];
}

class OtpVerification extends AuthState {
  final String email;

  const OtpVerification({required this.email});

  @override
  List<Object?> get props => [email];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}

class Unauthenticated extends AuthState {
  final String message;

  const Unauthenticated({required this.message});

  @override
  List<Object?> get props => [message];
}
