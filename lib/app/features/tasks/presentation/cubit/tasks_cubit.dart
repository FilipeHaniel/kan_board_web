import 'package:bloc/bloc.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/move_task_usecase.dart';
import 'package:kan_board_web/app/features/tasks/presentation/cubit/tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final GetTasksUsecase _getTasksUsecase;
  final MoveTaskUsecase _moveTaskUsecase;
  final AppLogger _logger;

  TasksCubit({
    required GetTasksUsecase getTasksUsecase,
    required MoveTaskUsecase moveTaskUsecase,
    required AppLogger logger,
  }) : _getTasksUsecase = getTasksUsecase,
       _moveTaskUsecase = moveTaskUsecase,
       _logger = logger,
       super(TasksInitial());

  Future<void> loadTasks() async {
    try {
      _logger.info('Carregando tasks');

      emit(TasksLoading());

      final result = await _getTasksUsecase();

      switch (result) {
        case Success(data: final tasks):
          _logger.info('Tasks carregadas: ${tasks.length}');
          emit(TasksSuccess(tasks: tasks));

        case FailureResult(failure: final failure):
          _logger.error('Erro ao carregar tasks: ${failure.message}');
          emit(TasksError(failure.message));
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

  Future<void> moveTask({
    required String taskId,
    required String status,
  }) async {
    try {
      _logger.info('Movendo task: $taskId para status: $status');
      final result = await _moveTaskUsecase(
        taskId: taskId,
        status: status,
      );

      switch (result) {
        case Success():
          _logger.info('Task movida com sucesso');
          await loadTasks();

        case FailureResult(failure: final failure):
          _logger.error('Erro ao mover task: ${failure.message}');
          emit(TasksError(failure.message));
      }
    } catch (error, stackTrace) {
      _logger.error(
        'Erro ao mover task',
        error: error,
        stackTrace: stackTrace,
      );
      _logger.error('Erro inesperado ao mover task');
      emit(
        TasksError(
          'Erro inesperado',
        ),
      );
    }
  }
}
