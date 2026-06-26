import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/layout/topbar/topbar_info_chip.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 24),
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
          Text(goal.title),
          SizedBox(width: 20),
          TopbarInfoChip(
            title: '🔥 Ritmo',
            value: '7 dias',
          ),
          SizedBox(width: 20),
          TopbarInfoChip(
            title: '⏱ Semana',
            value: '12h',
          ),
          SizedBox(width: 20),
          TopbarInfoChip(
            title: '🔁 Revisões',
            value: '3',
          ),
          Spacer(),
          TopbarUserMenu(),
        ],
      ),
    );
  }
}
