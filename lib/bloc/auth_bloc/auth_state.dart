import 'package:equatable/equatable.dart';
import 'package:doctor/data/models/auth_model/login_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthModel authModel;

  const AuthSuccess(this.authModel);

  @override
  List<Object?> get props => [authModel];
}

class AuthTokenFound extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthLoggedOut extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}