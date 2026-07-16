import 'package:kan_board_web/app/features/Contents/domain/entities/content_entity.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final GoalEntity goal;
  final List<SubjectEntity> subjects;
  final List<DivisionEntity> divisions;
  final List<ContentEntity> contents;
  final List<TaskEntity> tasks;

  DashboardSuccess({
    required this.goal,
    required this.subjects,
    required this.divisions,
    required this.contents,
    required this.tasks,
  });
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}
