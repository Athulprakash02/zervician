import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zervician/models/user_model.dart';
import 'package:zervician/services/auth_service/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      UserModel? user =
          await AuthService().login(event.username, event.password);

      if (user != null) {
        emit(AuthLoaded(user: user));
      } else {
        log('message');
        emit(AuthError(errorMessage: "Invalid credentials"));
      }
    });
    on<LogoutEvent>((event, emit) {
      AuthService().logout();
      emit(AuthInitial());
    });
    on<LoginEventSuccess>((event, emit) {
      emit(AuthLoaded(user: event.user));
    });
  }
}
