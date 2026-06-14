import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/layout/content/kanban_column.dart';

class DivisionSection extends StatelessWidget {
  final String title;

  const DivisionSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📘 $title',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: KanbanColumn(
                title: 'Backlog',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: KanbanColumn(
                title: 'Hoje',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: KanbanColumn(
                title: 'Revisão',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: KanbanColumn(
                title: 'Concluído',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
