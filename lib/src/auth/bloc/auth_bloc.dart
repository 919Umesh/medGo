import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project_bloc/src/auth/repository/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  // Default constructor using singleton
  AuthBloc() : this._(AuthRepository.instance);

  // Private constructor for dependency injection
  AuthBloc._(this._authRepository) : super(AuthInitial()) {
    on<SignIn>(_onSignIn);
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _authRepository.signInWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );
    if (result.error != null) {
      emit(AuthError(result.error!));
    } else if (result.userId != null) {
      debugPrint('------------Success------------');
      debugPrint(result.userId!);
      emit(Authenticated(result.userId!));
    } else {
      emit(Unauthenticated(message: 'Authentication failed'));
    }
  }
}
