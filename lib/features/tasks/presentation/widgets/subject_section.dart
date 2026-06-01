import 'package:flutter/material.dart';
import 'package:kan_board_web/features/tasks/domain/entities/task.dart';
import 'package:kan_board_web/features/tasks/presentation/widgets/division_section.dart';

class SubjectSection extends StatelessWidget {
  final String subject;
  final List<Task> tasks;
  final Function(Task, String) onTaskDropped;

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
          '📚 $subject',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
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
