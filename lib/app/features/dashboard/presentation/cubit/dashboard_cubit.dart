import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/domain/usecases/get_dashboard_usecase.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';
import 'package:kan_board_web/app/features/divisions/domain/usecases/create_division_usecase.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/create_subject_usecase.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/move_task_usecase.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardUsecase _getDashboard;
  final CreateSubjectUsecase _createSubject;
  final CreateDivisionUsecase _createDivision;
  final MoveTaskUsecase _moveTask;

  DashboardCubit({
    required GetDashboardUsecase getDashboard,
    required CreateSubjectUsecase createSubject,
    required CreateDivisionUsecase createDivision,
    required MoveTaskUsecase moveTask,
  }) : _getDashboard = getDashboard,
       _createSubject = createSubject,
       _createDivision = createDivision,
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

  Future<void> createSubject({
    required String goalId,
    required String name,
  }) async {
    final currentState = state;

    if (currentState is! DashboardSuccess) return;

    final result = await _createSubject(
      subject: SubjectEntity(
        id: '',
        name: name,
        goalId: goalId,
      ),
    );

    switch (result) {
      case Success(data: final subject):
        emit(
          DashboardSuccess(
            goal: currentState.goal,
            subjects: [
              ...currentState.subjects,
              DashboardSubjectEntity(
                id: subject.id,
                name: subject.name,
                divisions: const [],
              ),
            ],
          ),
        );

      case FailureResult(failure: final failure):
        emit(
          DashboardError(
            failure.message,
          ),
        );
      // tratar erro
    }
  }

  Future<void> createDivision({
    required String subjectId,
    required String name,
  }) async {
    final currentState = state;

    if (currentState is! DashboardSuccess) return;

    final result = await _createDivision(
      division: DivisionEntity(
        id: '',
        name: name,
        subjectId: subjectId,
      ),
    );

    switch (result) {
      case Success(data: final division):
        final subjects = currentState.subjects.map((subject) {
          if (subject.id != subjectId) {
            return subject;
          }

          return subject.copyWith(
            divisions: [
              ...subject.divisions,
              DashboardDivisionEntity(
                id: division.id,
                name: division.name,
                contents: const [],
              ),
            ],
          );
        }).toList();

        emit(
          DashboardSuccess(
            goal: currentState.goal,
            subjects: subjects,
          ),
        );

      case FailureResult():
        break;
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
