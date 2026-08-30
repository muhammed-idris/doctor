class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({
    required this.email,
    required this.password,
  });
}

class RegisterRequested extends AuthEvent {
  final String number;
  final String email;
  final String password;

  RegisterRequested({
    required this.number,
    required this.email,
    required this.password,
  });
}

class CheckAuthStatusEvent extends AuthEvent {}

class LogoutRequested extends AuthEvent {}