import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project_bloc/src/auth/repository/auth_repo.dart';
import '../../../core/injection/injection_helper.dart';
import '../../../core/services/sharepref/flutter_secure_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<SignIn>(_onSignIn);
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final result = await _authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated(
        message: 'Authentication successful',
        userId: result.userId!,
        email: result.email,
      ));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
