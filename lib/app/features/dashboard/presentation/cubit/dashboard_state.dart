import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final GoalEntity goal;
  final List<DashboardSubjectEntity> subjects;

  DashboardSuccess({
    required this.goal,
    required this.subjects,
  });
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}
