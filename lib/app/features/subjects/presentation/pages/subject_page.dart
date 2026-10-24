import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/core/layout/app_layout.dart';
import 'package:kan_board_web/app/core/layout/content/kanban_area.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

class SubjectPage extends StatelessWidget {
  final GoalEntity goal;
  final DashboardSubjectEntity subject;

  const SubjectPage({
    super.key,
    required this.goal,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      goal: goal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 8),
                Text(
                  subject.name,
                  style: KanBoardDSTextStyles.headlineLarge(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                return switch (state) {
                  DashboardLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  DashboardSuccess(:final subjects) => _buildKanban(
                    context,
                    subjects,
                  ),
                  DashboardError(:final message) => Center(
                    child: Text(message),
                  ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKanban(
    BuildContext context,
    List<DashboardSubjectEntity> subjects,
  ) {
    DashboardSubjectEntity? currentSubject;

    for (final item in subjects) {
      if (item.id == subject.id) {
        currentSubject = item;
        break;
      }
    }

    if (currentSubject == null) {
      return const Center(
        child: Text('Matéria não encontrada.'),
      );
    }

    return KanbanArea(
      subject: currentSubject,
      onTaskDropped: (task, status) {
        context.read<DashboardCubit>().moveTask(
          taskId: task.id,
          status: status,
        );
      },
    );
  }
}
