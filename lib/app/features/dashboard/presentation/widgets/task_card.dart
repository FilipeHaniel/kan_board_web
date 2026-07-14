import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/spacing/kanboard_ds_spacing.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/features/study/presentation/pages/study_page.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(
            KanBoardDSSpacing.space8,
          ),
          child: Text(
            task.title,
            style: KanBoardDSTextStyles.bodyMedium(context),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StudyPage(
              taskTitle: task.title,
            ),
          ),
        );
      },
    );
  }
}
