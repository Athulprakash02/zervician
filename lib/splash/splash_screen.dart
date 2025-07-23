import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zervician/auth/login.dart';
import 'package:zervician/blocs/auth/auth_bloc.dart';
import 'package:zervician/blocs/splash/splash_bloc.dart';
import 'package:zervician/home/home.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Future.microtask(() {
      context.read<SplashBloc>().add(NavigateToHomeScreenEvent());
    });
    return Scaffold(
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return  Center(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(seconds: 2),
                      builder: (context, value, child) {
                        return Opacity(
            opacity: value,
            child: Transform.scale(
              scale: 0.5 + 0.5 * value,
              child: const Text(
                'Z',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
                        );
                      },
                    ),
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
