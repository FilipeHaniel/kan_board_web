import 'package:flutter/material.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/widgets/division_section.dart';

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
        children: subject.divisions.map((division) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: DivisionSection(
              division: division,
              onTaskDropped: onTaskDropped,
            ),
          );
        }).toList(),
      ),
    );
  }
}
