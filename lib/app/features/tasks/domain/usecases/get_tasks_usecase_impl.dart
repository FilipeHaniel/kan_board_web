import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';
import 'package:kan_board_web/app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/get_tasks_usecase.dart';

class GetTasksUsecaseImpl implements GetTasksUsecase {
  final TasksRepository _repository;

  GetTasksUsecaseImpl({
    required TasksRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<List<TaskEntity>>> call() {
    return _repository.getTasks();
  }
}
