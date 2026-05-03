import 'package:flutter/material.dart';
import 'package:kan_board_web/features/tasks/domain/entities/task.dart';
import 'task_card.dart';

class KanbanColumn extends StatelessWidget {
  final String title;
  final String status;
  final List<Task> tasks;
  final Function(Task, String) onTaskDropped;

  const KanbanColumn({
    super.key,
    required this.title,
    required this.status,
    required this.tasks,
    required this.onTaskDropped,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DragTarget<Task>(
        onAcceptWithDetails: (details) {
          final task = details.data;
          onTaskDropped(task, status);
        },
        builder: (context, candidateData, rejectedData) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: candidateData.isNotEmpty
                  ? Colors.green[200]
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                ...tasks.map((task) {
                  return Draggable<Task>(
                    data: task,
                    feedback: Material(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.blue,
                        child: Text(task.title),
                      ),
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.5,
                      child: TaskCard(task: task),
                    ),
                    child: TaskCard(task: task),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
