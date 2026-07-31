import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/layout/content/kanban_column.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';

class ContentSection extends StatelessWidget {
  final DashboardContentEntity content;
  final Function(DashboardTaskEntity, String) onTaskDropped;

  const ContentSection({
    super.key,
    required this.content,
    required this.onTaskDropped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(content.title),
        const SizedBox(height: 12),
        Row(
          children: [
            KanbanColumn(
              title: 'Backlog',
              status: 'BACKLOG',
              tasks: content.tasks.where((e) => e.status == 'BACKLOG').toList(),
              onTaskDropped: onTaskDropped,
            ),
            KanbanColumn(
              title: 'Hoje',
              status: 'TODAY',
              tasks: content.tasks.where((e) => e.status == 'TODAY').toList(),
              onTaskDropped: onTaskDropped,
            ),
            KanbanColumn(
              title: 'Concluído',
              status: 'DONE',
              tasks: content.tasks.where((e) => e.status == 'DONE').toList(),
              onTaskDropped: onTaskDropped,
            ),
          ],
        ),
      ],
    );
  }
}
