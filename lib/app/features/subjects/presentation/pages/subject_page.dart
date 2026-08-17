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
                if (state is DashboardLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is DashboardError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is! DashboardSuccess) {
                  return const SizedBox.shrink();
                }

                final currentSubject = state.subjects.firstWhere(
                  (item) => item.id == subject.id,
                );

                return KanbanArea(
                  subject: currentSubject,
                  onTaskDropped: (task, status) {
                    context.read<DashboardCubit>().moveTask(
                      taskId: task.id,
                      status: status,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
