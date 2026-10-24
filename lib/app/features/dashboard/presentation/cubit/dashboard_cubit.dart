import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/contents/domain/entities/content_entity.dart';
import 'package:kan_board_web/app/features/contents/domain/usecases/create_content_usecase.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/domain/usecases/get_dashboard_usecase.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/create_subject_usecase.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/create_task_usecase.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/move_task_usecase.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardUsecase _getDashboard;
  final CreateSubjectUsecase _createSubject;
  final CreateContentUsecase _createContent;
  final CreateTaskUsecase _createTask;
  final MoveTaskUsecase _moveTask;

  DashboardCubit({
    required GetDashboardUsecase getDashboard,
    required CreateSubjectUsecase createSubject,
    required CreateContentUsecase createContent,
    required CreateTaskUsecase createTask,
    required MoveTaskUsecase moveTask,
  }) : _getDashboard = getDashboard,
       _createSubject = createSubject,
       _createContent = createContent,
       _createTask = createTask,
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
      emit(DashboardError('Erro ao carregar dashboard'));
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
                contents: const [],
              ),
            ],
          ),
        );

      case FailureResult(failure: final failure):
        emit(DashboardError(failure.message));
    }
  }

  Future<void> createContent({
    required String subjectId,
    required String name,
  }) async {
    final currentState = state;

    if (currentState is! DashboardSuccess) return;

    final result = await _createContent(
      ContentEntity(
        id: '',
        title: name,
        subjectId: subjectId,
        status: 'NOT_STARTED',
        position: 0,
        tasks: const [],
      ),
    );

    switch (result) {
      case Success(data: final content):
        final subjects = currentState.subjects.map((subject) {
          if (subject.id != subjectId) {
            return subject;
          }

          return subject.copyWith(
            contents: [
              ...subject.contents,
              DashboardContentEntity(
                id: content.id,
                title: content.title,
                status: content.status,
                position: content.position,
                tasks: const [],
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

      case FailureResult(failure: final failure):
        emit(DashboardError(failure.message));
    }
  }

  Future<void> createTask({
    required String contentId,
    required String title,
  }) async {
    final currentState = state;

    if (currentState is! DashboardSuccess) return;

    final result = await _createTask(
      task: TaskEntity(
        id: '',
        title: title,
        status: 'BACKLOG',
        position: 0,
        contentId: contentId,
      ),
    );

    switch (result) {
      case Success(data: final task):
        final subjects = currentState.subjects.map((subject) {
          return subject.copyWith(
            contents: subject.contents.map((content) {
              if (content.id != contentId) {
                return content;
              }

              return content.copyWith(
                tasks: [
                  ...content.tasks,
                  DashboardTaskEntity(
                    id: task.id,
                    title: task.title,
                    status: task.status,
                    position: task.position,
                    estimatedMinutes: task.estimatedMinutes,
                  ),
                ],
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

      case FailureResult(failure: final failure):
        emit(DashboardError(failure.message));
    }
  }

  Future<void> moveTask({
    required String taskId,
    required String status,
  }) async {
    final currentState = state;

    if (currentState is! DashboardSuccess) return;

    final previousState = currentState;

    final subjects = currentState.subjects.map((subject) {
      return subject.copyWith(
        contents: subject.contents.map((content) {
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
    }).toList();

    emit(
      DashboardSuccess(
        goal: currentState.goal,
        subjects: subjects,
      ),
    );

    final result = await _moveTask(
      taskId: taskId,
      status: status,
    );

    switch (result) {
      case Success():
        break;

      case FailureResult(failure: final failure):
        emit(previousState);
        emit(DashboardError(failure.message));
    }
  }
}
