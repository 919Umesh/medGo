import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_bloc/core/injection/injection_helper.dart';
import 'package:project_bloc/core/services/sharepref/share_pref.dart';
import 'package:project_bloc/src/auth/repository/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignIn>(_onSignIn);
    on<SignUp>(_onSignUp);
    on<ResendConfirmation>(_onResendConfirmation);
    on<VerifyOtp>(_onVerifyOtp);
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await AuthRepository().signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      locator<PrefHelper>().setIsLogin(true);
      await locator<PrefHelper>().setUserToken(result.userId.toString());
      emit(Authenticated(
        message: 'Authentication successful',
        userId: result.userId!,
        email: result.email,
      ));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await AuthRepository().signUpWithEmail(
        email: event.email,
        password: event.password,
        userMetadata:
            event.fullName != null ? {'full_name': event.fullName} : null,
      );

      if (result.error != null) {
        emit(AuthError(message: result.error!));
        return;
      }

      if (result.requiresConfirmation) {
        emit(RegistrationPending(
          email: result.email!,
          message: 'Please check your email for confirmation',
        ));
      } else {
        locator<PrefHelper>().setIsLogin(true);
        await locator<PrefHelper>().setUserToken(result.userId.toString());
        emit(Authenticated(
          message: 'Registration successful',
          userId: result.userId!,
          email: result.email!,
        ));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onResendConfirmation(
      ResendConfirmation event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await AuthRepository().resendConfirmationEmail(event.email);
      emit(RegistrationPending(
        email: event.email,
        message: 'Confirmation email resent. Please check your inbox.',
      ));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onVerifyOtp(VerifyOtp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await AuthRepository().verifyOtp(
        email: event.email,
        otp: event.otp,
      );

      locator<PrefHelper>().setIsLogin(true);
      await locator<PrefHelper>().setUserToken(result.userId.toString());
      emit(Authenticated(
        message: 'Verification successful',
        userId: result.userId!,
        email: result.email,
      ));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
