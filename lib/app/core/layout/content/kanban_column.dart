import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/layout/content/study_card.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';

class KanbanColumn extends StatelessWidget {
  final String title;
  final String status;
  final List<DashboardTaskEntity> tasks;
  final Function(DashboardTaskEntity, String) onTaskDropped;

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
      child: DragTarget<DashboardTaskEntity>(
        onAcceptWithDetails: (details) {
          onTaskDropped(details.data, status);
        },
        builder: (context, candidateData, rejectedData) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title (${tasks.length})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ...tasks.map(
                  (task) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: StudyCard(
                      task: task,
                    ),
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
