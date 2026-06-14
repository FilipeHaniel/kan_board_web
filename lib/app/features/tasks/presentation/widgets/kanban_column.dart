import 'package:flutter/material.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task.dart';
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
          onTaskDropped(details.data, status);
        },
        builder: (context, candidateData, rejectedData) {
          return Container(
            height: 200,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: candidateData.isNotEmpty
                  ? Colors.green.shade100
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Divider(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: tasks.isEmpty
                      ? Center(
                          child: Text(
                            'Nenhuma tarefa',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            final task = tasks[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Draggable<Task>(
                                data: task,
                                feedback: Material(
                                  elevation: 4,
                                  borderRadius: BorderRadius.circular(8),
                                  child: SizedBox(
                                    width: 250,
                                    child: TaskCard(
                                      task: task,
                                    ),
                                  ),
                                ),
                                childWhenDragging: Opacity(
                                  opacity: 0.4,
                                  child: TaskCard(
                                    task: task,
                                  ),
                                ),
                                child: TaskCard(
                                  task: task,
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
