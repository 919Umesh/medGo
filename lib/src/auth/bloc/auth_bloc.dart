// lib/src/auth/bloc/auth_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_bloc/core/injection/injection_helper.dart';
import 'package:project_bloc/core/services/sharepref/share_pref.dart';
import 'package:project_bloc/src/auth/repository/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignIn>(_onSignIn);
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await AuthRepository().signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      locator<PrefHelper>().setIsLogin(true);
      // Usage
      try {
        await locator<PrefHelper>().setUserToken(result.userId.toString());
        debugPrint('-------------Id---------');
        debugPrint(result.userId);
        final String? userId = await locator<PrefHelper>().getUserToken();
        if (userId != null) {
          Fluttertoast.showToast(msg: userId);
        } else {
          Fluttertoast.showToast(msg: "No user token found");
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "Error handling user token: $e");
      }
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
