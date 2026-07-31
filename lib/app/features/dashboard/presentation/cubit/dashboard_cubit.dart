import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/features/dashboard/domain/usecases/get_dashboard_usecase.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/move_task_usecase.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardUsecase _getDashboard;
  final MoveTaskUsecase _moveTask;

  DashboardCubit({
    required GetDashboardUsecase getDashboard,
    required MoveTaskUsecase moveTask,
  }) : _getDashboard = getDashboard,
       _moveTask = moveTask,
       super(DashboardInitial());

  Future<void> loadDashboard(GoalEntity goal) async {
    emit(DashboardLoading());

    try {
      final subjects = await _getDashboard(goalId: goal.id);

      emit(
        DashboardSuccess(
          goal: goal,
          subjects: subjects,
        ),
      );
    } catch (_) {
      emit(
        DashboardError(
          'Erro ao carregar dashboard',
        ),
      );
    }
  }

  Future<void> moveTask({
    required String taskId,
    required String status,
  }) async {
    final currentState = state;

    if (currentState is! DashboardSuccess) return;

    await _moveTask(
      taskId: taskId,
      status: status,
    );

    final subjects = currentState.subjects.map((subject) {
      return subject.copyWith(
        divisions: subject.divisions.map((division) {
          return division.copyWith(
            contents: division.contents.map((content) {
              return content.copyWith(
                tasks: content.tasks.map((task) {
                  if (task.id == taskId) {
                    return task.copyWith(status: status);
                  }
                  return task;
                }).toList(),
              );
            }).toList(),
          );
        }).toList(),
      );
    }).toList();

    emit(
      DashboardSuccess(
        goal: currentState.goal,
        subjects: subjects,
      ),
    );
  }
}
