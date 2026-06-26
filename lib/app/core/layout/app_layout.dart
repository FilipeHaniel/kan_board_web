import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/layout/sidebar/app_sidebar.dart';
import 'package:kan_board_web/app/core/layout/topbar/app_topbar.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final GoalEntity goal;

  const AppLayout({
    super.key,
    required this.child,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AppSidebar(),
          Expanded(
            child: Column(
              children: [
                AppTopbar(goal: goal),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
