import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/core/routes/app_routes.dart';
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
              style: KanBoardDSTextStyles.titleMedium(context),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.dashboard,
                arguments: goal,
              );
            },
          ),
        );
      },
    );
  }
}
