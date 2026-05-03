import 'package:flutter/material.dart';
import 'package:kan_board_web/features/tasks/domain/entities/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(task.title),
      ),
    );
  }
}
