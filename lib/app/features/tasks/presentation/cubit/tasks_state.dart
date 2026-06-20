import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';

sealed class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksSuccess extends TasksState {
  final List<TaskEntity> tasks;

  TasksSuccess(this.tasks);
}

class TasksError extends TasksState {
  final String message;

  TasksError(this.message);
}
