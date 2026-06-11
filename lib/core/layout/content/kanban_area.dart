import 'package:flutter/material.dart';
import 'package:kan_board_web/features/tasks/domain/entities/task.dart';
import 'package:kan_board_web/features/tasks/presentation/widgets/subject_section.dart';

class KanbanArea extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task, String) onTaskDropped;

  const KanbanArea({
    super.key,
    required this.tasks,
    required this.onTaskDropped,
  });

  @override
  Widget build(BuildContext context) {
    final subjects = tasks.map((task) => task.subject).toSet().toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: subjects.map((subject) {
          final subjectTasks = tasks
              .where((task) => task.subject == subject)
              .toList();

          return Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SubjectSection(
              subject: subject,
              tasks: subjectTasks,
              onTaskDropped: onTaskDropped,
            ),
          );
        }).toList(),
      ),
    );
  }
}
