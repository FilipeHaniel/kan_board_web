import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';

abstract class GetTasksUsecase {
  Future<Result<List<TaskEntity>>> call();
}
