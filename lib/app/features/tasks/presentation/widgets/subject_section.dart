import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';
import 'package:kan_board_web/app/features/tasks/presentation/widgets/division_section.dart';

class SubjectSection extends StatelessWidget {
  final String subject;
  final List<TaskEntity> tasks;
  final Function(TaskEntity, String) onTaskDropped;

  const SubjectSection({
    super.key,
    required this.subject,
    required this.tasks,
    required this.onTaskDropped,
  });

  @override
  Widget build(BuildContext context) {
    final divisions = tasks.map((t) => t.division).toSet().toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subject,
          style: KanBoardDSTextStyles.headlineLarge(context),
        ),
        const SizedBox(height: 24),
        ...divisions.map(
          (division) => Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: DivisionSection(
              division: division,
              tasks: tasks,
              onTaskDropped: onTaskDropped,
            ),
          ),
        ),
      ],
    );
  }
}
