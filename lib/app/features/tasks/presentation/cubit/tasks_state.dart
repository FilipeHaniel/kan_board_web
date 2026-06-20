import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';

sealed class TasksState {
  const TasksState();
}

class TasksInitial extends TasksState {
  const TasksInitial();
}

class TasksLoading extends TasksState {
  const TasksLoading();
}

class TasksSuccess extends TasksState {
  final List<TaskEntity> tasks;

  const TasksSuccess({
    required this.tasks,
  });
}

class TasksError extends TasksState {
  final String message;

  const TasksError(this.message);
}
