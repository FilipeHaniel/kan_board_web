import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/bloc/app_bloc_observer.dart';
import 'package:kan_board_web/app/core/design_system/foundations/colors/kanboard_ds_light_colors.dart';
import 'package:kan_board_web/app/core/design_system/theme/kanboard_ds_theme_colors.dart';
import 'package:kan_board_web/app/core/di/injector.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/routes/app_routes.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:kan_board_web/app/features/auth/presentation/pages/login_page.dart';
import 'package:kan_board_web/app/features/auth/presentation/pages/splash_page.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/goals/presentation/pages/goals_page.dart';
import 'package:kan_board_web/app/features/tasks/presentation/pages/dashboard_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();

  final logger = getIt<AppLogger>();

  Bloc.observer = AppBlocObserver(
    logger: logger,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KanBoard',
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashPage(),
        AppRoutes.login: (_) => BlocProvider(
          create: (_) => getIt<LoginCubit>(),
          child: const LoginPage(),
        ),
        AppRoutes.goals: (_) => const GoalsPage(),
        AppRoutes.dashboard: (context) {
          final goal = ModalRoute.of(context)!.settings.arguments as GoalEntity;

          return DashboardPage(
            goal: goal,
          );
        },
      },
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        useMaterial3: true,
        extensions: [
          KanBoardDSThemeColors(
            colors: kanBoardDSLightColorScheme,
          ),
        ],
      ),
    );
  }
}
