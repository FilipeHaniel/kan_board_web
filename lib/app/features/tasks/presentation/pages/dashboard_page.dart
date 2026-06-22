import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/di/injector.dart';
import 'package:kan_board_web/app/core/layout/app_layout.dart';
import 'package:kan_board_web/app/core/layout/content/kanban_area.dart';
import 'package:kan_board_web/app/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:kan_board_web/app/features/tasks/presentation/cubit/tasks_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TasksCubit>()..loadTasks(),
      child: AppLayout(
        child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            return switch (state) {
              TasksInitial() => const SizedBox.shrink(),
              TasksLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              TasksSuccess(:final tasks) => KanbanArea(
                tasks: tasks,
                onTaskDropped: (task, newStatus) {
                  context.read<TasksCubit>().moveTask(
                    taskId: task.id,
                    status: newStatus,
                  );
                },
              ),
              TasksError(:final message) => Center(
                child: Text(
                  message,
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}
