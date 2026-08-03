import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/widgets/subject_section.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/subjects/presentation/widgets/add_subject_button.dart';

class KanbanArea extends StatelessWidget {
  final GoalEntity goal;
  final List<DashboardSubjectEntity> subjects;

  final Function(DashboardTaskEntity, String) onTaskDropped;

  const KanbanArea({
    super.key,
    required this.goal,
    required this.subjects,
    required this.onTaskDropped,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddSubjectButton(
            onCreate: (name) async {
              await context.read<DashboardCubit>().createSubject(
                goalId: goal.id,
                name: name,
              );
            },
          ),
          const SizedBox(height: 40),
          ...subjects.map((subject) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SubjectSection(
                subject: subject,
                onTaskDropped: onTaskDropped,
              ),
            );
          }),
        ],
      ),
    );
  }
}
