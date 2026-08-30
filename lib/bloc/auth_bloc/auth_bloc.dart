import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/repos/auth_repo.dart';

import '../../core/storge/token_storge.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLogin);
    on<RegisterRequested>(_onRegister);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<LogoutRequested>(_onLogout);
  }

  // ================= LOGIN =================

  Future<void> _onLogin(
      LoginRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      final authModel = await authRepository.login(
        email: event.email,
        password: event.password,
      );

      // Save token received from API
      await TokenStorage.saveToken(authModel.token);

      emit(AuthSuccess(authModel));
    } catch (e) {
      emit(
        AuthFailure(
          e.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  // ================= REGISTER =================

  Future<void> _onRegister(
      RegisterRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      final authModel = await authRepository.register(
        number: event.number,
        email: event.email,
        password: event.password,
      );

      // Save token received from API
      await TokenStorage.saveToken(authModel.token);

      emit(AuthSuccess(authModel));
    } catch (e) {
      emit(
        AuthFailure(
          e.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  // ================= CHECK AUTH =================

  Future<void> _onCheckAuthStatus(
      CheckAuthStatusEvent event,
      Emitter<AuthState> emit,
      ) async {
    final hasToken = await TokenStorage.hasToken();

    if (hasToken) {
      emit(AuthTokenFound());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  // ================= LOGOUT =================

  Future<void> _onLogout(
      LogoutRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      await authRepository.logout();
    } catch (_) {
      emit(AuthFailure('Failed to logout'));
    }

    await TokenStorage.removeToken();

    emit(AuthLoggedOut());
  }
}