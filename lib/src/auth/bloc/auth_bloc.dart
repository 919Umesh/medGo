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
}
