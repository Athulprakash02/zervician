part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

 class SplashInitial extends SplashState {}

class LoadingState extends SplashState {}


class AuthenticateState extends SplashState {
    final UserModel user; 

  AuthenticateState({required this.user});
}

class UnAuthenticateState extends SplashState {}


