import 'package:flutter/material.dart';

import 'package:kan_board_web/app/features/tasks/domain/entities/task.dart';
import 'package:kan_board_web/app/features/tasks/presentation/widgets/kanban_column.dart';

class DivisionSection extends StatelessWidget {
  final String division;
  final List<Task> tasks;
  final Function(Task, String) onTaskDropped;

  const DivisionSection({
    super.key,
    required this.division,
    required this.tasks,
    required this.onTaskDropped,
  });

  @override
  Widget build(BuildContext context) {
    final divisionTasks = tasks
        .where(
          (t) => t.division == division,
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📘 $division',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            KanbanColumn(
              title: 'Backlog',
              status: 'backlog',
              tasks: divisionTasks.where((t) => t.status == 'backlog').toList(),
              onTaskDropped: onTaskDropped,
            ),
            KanbanColumn(
              title: 'Hoje',
              status: 'today',
              tasks: divisionTasks.where((t) => t.status == 'today').toList(),
              onTaskDropped: onTaskDropped,
            ),
            KanbanColumn(
              title: 'Concluído',
              status: 'done',
              tasks: divisionTasks.where((t) => t.status == 'done').toList(),
              onTaskDropped: onTaskDropped,
            ),
          ],
        ),
      ],
    );
  }
}
