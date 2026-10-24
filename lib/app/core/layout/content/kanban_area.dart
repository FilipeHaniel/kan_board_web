import 'package:flutter/material.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/widgets/content_section.dart';

class KanbanArea extends StatelessWidget {
  final DashboardSubjectEntity subject;
  final Function(DashboardTaskEntity, String) onTaskDropped;

  const KanbanArea({
    super.key,
    required this.subject,
    required this.onTaskDropped,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: subject.contents.map((content) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: ContentSection(
              content: content,
              onTaskDropped: onTaskDropped,
            ),
          );
        }).toList(),
      ),
    );
  }
}
