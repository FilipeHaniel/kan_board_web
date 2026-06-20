import 'package:bloc/bloc.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:kan_board_web/app/features/tasks/presentation/cubit/tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final GetTasksUsecase _getTasksUsecase;
  final AppLogger _logger;

  TasksCubit({
    required GetTasksUsecase getTasksUsecase,
    required AppLogger logger,
  }) : _getTasksUsecase = getTasksUsecase,
       _logger = logger,
       super(TasksInitial());

  Future<void> loadTasks() async {
    try {
      emit(TasksLoading());

      final result = await _getTasksUsecase();

      switch (result) {
        case Success(data: final tasks):
          emit(
            TasksSuccess(tasks),
          );

        case FailureResult(
          failure: final failure,
        ):
          emit(
            TasksError(
              failure.message,
            ),
          );
      }
    } catch (error, stackTrace) {
      _logger.error(
        'Erro ao carregar tasks',
        error: error,
        stackTrace: stackTrace,
      );

      emit(
        TasksError(
          'Erro inesperado',
        ),
      );
    }
  }
}
