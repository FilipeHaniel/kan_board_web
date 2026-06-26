import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';

abstract class TasksRepository {
  Future<Result<List<TaskEntity>>> getTasks({required String goalId});

  Future<Result<void>> moveTask({
    required String taskId,
    required String status,
  });
}
