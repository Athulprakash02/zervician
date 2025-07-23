import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zervician/auth/login.dart';
import 'package:zervician/blocs/auth/auth_bloc.dart';
import 'package:zervician/blocs/splash/splash_bloc.dart';
import 'package:zervician/home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Future.microtask(() {
      context.read<SplashBloc>().add(NavigateToHomeScreenEvent());
    });
    return Scaffold(
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: Text('Splash'),
            );
          }
          if (state is AuthenticateState) {
             context.read<AuthBloc>().add(LoginEventSuccess(user: state.user));
            return const HomeScreen();
          }
          if (state is UnAuthenticateState) {
            return LoginScreen();
          }
          return const Center(
            child: Text('something went wrong'),
          );
        },
      ),
    );
  }
}
