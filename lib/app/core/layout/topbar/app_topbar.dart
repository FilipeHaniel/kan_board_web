import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/layout/topbar/topbar_user_menu.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

class AppTopbar extends StatelessWidget {
  final GoalEntity goal;

  const AppTopbar({
    required this.goal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            goal.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Spacer(),
          TopbarUserMenu(),
        ],
      ),
    );
  }
}
