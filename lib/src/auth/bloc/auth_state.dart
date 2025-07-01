import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Initial state when auth bloc is created
class AuthInitial extends AuthState {}

// Loading state (e.g., during sign in/up)
class AuthLoading extends AuthState {}

// Authenticated state (user is logged in)
class Authenticated extends AuthState {
  final String userId;

  Authenticated(this.userId);

  @override
  List<Object?> get props => [userId];
}

// Unauthenticated state (user is logged out)
class Unauthenticated extends AuthState {
  final String? message;

  Unauthenticated({this.message});

  @override
  List<Object?> get props => [message];
}

// Authentication failed state
class AuthError extends AuthState {
  final String error;

  AuthError(this.error);

  @override
  List<Object?> get props => [error];
}
