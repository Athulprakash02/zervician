part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final UserModel user;
  AuthLoaded({required this.user});
}

final class AuthError extends AuthState {

  final String errorMessage;
  AuthError({required this.errorMessage});
}