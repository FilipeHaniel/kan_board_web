import 'package:kan_board_web/app/features/tasks/data/models/task_model.dart';

abstract class TasksDatasource {
  Future<List<TaskModel>> getTasks();

  Future<void> moveTask({
    required String taskId,
    required String status,
  });
}
