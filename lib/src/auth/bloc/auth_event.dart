part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignIn extends AuthEvent {
  final String email;
  final String password;

  SignIn({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignUp extends AuthEvent {
  final String email;
  final String password;
  final String? fullName;

  SignUp({
    required this.email,
    required this.password,
    this.fullName,
  });

  @override
  List<Object?> get props => [email, password, fullName];
}

class ResendConfirmation extends AuthEvent {
  final String email;

  ResendConfirmation({required this.email});

  @override
  List<Object> get props => [email];
}

class VerifyOtp extends AuthEvent {
  final String email;
  final String otp;

  VerifyOtp({required this.email, required this.otp});

  @override
  List<Object?> get props => [email, otp];
}
