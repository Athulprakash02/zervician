part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;
  LoginEvent({required this.username, required this.password});
}

class LogoutEvent extends AuthEvent {}

class LoginEventSuccess extends AuthEvent {
  final UserModel user;
  LoginEventSuccess({required this.user});
}
