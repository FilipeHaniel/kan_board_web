import 'package:flutter/material.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

class GoalsListWidget extends StatelessWidget {
  final List<GoalEntity> goals;

  const GoalsListWidget({
    super.key,
    required this.goals,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: goals.length,
      separatorBuilder: (_, _) => const SizedBox(
        height: 16,
      ),
      itemBuilder: (context, index) {
        final goal = goals[index];

        return Card(
          child: ListTile(
            leading: const Icon(
              Icons.flag,
            ),
            title: Text(
              goal.title,
            ),
            subtitle: Text(
              goal.isActive ? 'Objetivo ativo' : 'Objetivo inativo',
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/dashboard',
                arguments: goal.id,
              );
            },
          ),
        );
      },
    );
  }
}
