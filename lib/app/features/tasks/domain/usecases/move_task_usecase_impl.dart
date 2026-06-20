import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/move_task_usecase.dart';

class MoveTaskUsecaseImpl implements MoveTaskUsecase {
  final TasksRepository _repository;

  MoveTaskUsecaseImpl({
    required TasksRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<void>> call({
    required String taskId,
    required String status,
  }) {
    return _repository.moveTask(
      taskId: taskId,
      status: status,
    );
  }
}
