import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';
import 'package:kan_board_web/app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/create_task_usecase.dart';

class CreateTaskUsecaseImpl implements CreateTaskUsecase {
  final TasksRepository _repository;

  CreateTaskUsecaseImpl({
    required TasksRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<TaskEntity>> call({required TaskEntity task}) async {
    return await _repository.createTask(task);
  }
}
