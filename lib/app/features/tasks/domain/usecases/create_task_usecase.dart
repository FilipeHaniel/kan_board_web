import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';

abstract interface class CreateTaskUsecase {
  Future<Result<TaskEntity>> call({required TaskEntity task});
}
