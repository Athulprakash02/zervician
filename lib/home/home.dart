
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zervician/auth/login.dart';
import 'package:zervician/blocs/auth/auth_bloc.dart';
import 'package:zervician/constants/app_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
            },
          ),
        ],
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AuthLoaded) {
            return Container(
              decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).colorScheme.primary.withOpacity(0.3), Theme.of(context).colorScheme.background],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
              child: Center(
              child: Container(
                width: size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.surface.withOpacity(.8),
                 
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.15,
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      child: Text(state.user.name![0].toUpperCase(), style: TextStyle(fontSize: size.width * 0.15, color: Theme.of(context).colorScheme.onBackground)),
                    ),
                    const SizedBox(height: 20),
                    Divider(thickness: 1.5, color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
                    const SizedBox(height: 16),
                   Text(state.user.name!, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text(state.user.email!, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.center,
                      child: Chip(
                        label: Text(state.user.type!, style: AppTextStyles.largeBoldTextStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                        
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ),
                    ),
            );
          } else if (state is AuthError) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: Text('Please login to continue'));
          }
        },
      ),
    );
  }
}
