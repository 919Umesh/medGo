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
