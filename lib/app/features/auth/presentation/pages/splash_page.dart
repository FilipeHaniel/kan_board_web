import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/di/injector.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/auth_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>()..checkAuth(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          switch (state) {
            case Authenticated():
              Navigator.pushReplacementNamed(
                context,
                '/dashboard',
              );

            case Unauthenticated():
              Navigator.pushReplacementNamed(
                context,
                '/login',
              );

            case AuthInitial():
            case AuthLoading():
            case AuthError():
              break;
          }
        },
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
