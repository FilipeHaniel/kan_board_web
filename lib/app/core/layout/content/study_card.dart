import 'package:flutter/material.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';

class StudyCard extends StatelessWidget {
  final DashboardTaskEntity task;

  const StudyCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<DashboardTaskEntity>(
      data: task,
      feedback: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: 260,
          child: _Card(task),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: .4,
        child: _Card(task),
      ),
      child: _Card(task),
    );
  }
}

class _Card extends StatelessWidget {
  final DashboardTaskEntity task;

  const _Card(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(task.title),
      ),
    );
  }
}
