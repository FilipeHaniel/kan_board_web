import 'package:kan_board_web/app/core/exceptions/server_exception.dart';
import 'package:kan_board_web/app/core/failures/server_failure.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/tasks/data/datasources/tasks_datasource.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';
import 'package:kan_board_web/app/features/tasks/domain/repositories/tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  final TasksDatasource _datasource;
  final AppLogger _logger;

  TasksRepositoryImpl({
    required TasksDatasource datasource,
    required AppLogger logger,
  }) : _datasource = datasource,
       _logger = logger;

  @override
  Future<Result<List<TaskEntity>>> getTasks({required String goalId}) async {
    try {
      _logger.info('Repository getTasks');

      final tasks = await _datasource.getTasks(goalId: goalId);

      return Success(tasks);
    } on ServerException {
      return FailureResult(
        ServerFailure(),
      );
    }
  }

  @override
  Future<Result<void>> moveTask({
    required String taskId,
    required String status,
  }) async {
    try {
      await _datasource.moveTask(
        taskId: taskId,
        status: status,
      );

      return const Success(null);
    } on ServerException {
      return FailureResult(
        ServerFailure(),
      );
    }
  }
}
