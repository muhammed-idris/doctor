import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/auth_model/auth_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginRequested>(_login);
    on<RegisterRequested>(_register);
    on<LogoutRequested>(_logout);
  }

  Future<void> _login(
      LoginRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      final user = await authRepository.login(
        email: event.email,
        password: event.password,
      );

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _register(
      RegisterRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      final user = await authRepository.register(
        number: event.number,
        email: event.email,
        password: event.password,
      );

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _logout(
      LogoutRequested event,
      Emitter<AuthState> emit,
      ) {
    emit(AuthLoggedOut());
  }
}