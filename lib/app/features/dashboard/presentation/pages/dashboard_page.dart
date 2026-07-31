import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/core/di/injector.dart';
import 'package:kan_board_web/app/core/layout/app_layout.dart';
import 'package:kan_board_web/app/core/layout/content/kanban_area.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

class DashboardPage extends StatelessWidget {
  final GoalEntity goal;

  const DashboardPage({
    super.key,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DashboardCubit>()..loadDashboard(goal),
      child: AppLayout(
        goal: goal,
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return switch (state) {
              DashboardInitial() => const SizedBox.shrink(),

              DashboardLoading() => const Center(
                child: CircularProgressIndicator(),
              ),

              DashboardSuccess(
                :final goal,
                :final subjects,
              ) =>
                KanbanArea(
                  goal: goal,
                  subjects: subjects,
                  onTaskDropped: (task, status) {
                    context.read<DashboardCubit>().moveTask(
                      taskId: task.id,
                      status: status,
                    );
                  },
                ),

              DashboardError(:final message) => Center(
                child: Text(
                  message,
                  style: KanBoardDSTextStyles.error(context),
                ),
              ),

              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
