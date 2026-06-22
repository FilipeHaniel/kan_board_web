import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

sealed class GoalsState {}

class GoalsInitial extends GoalsState {}

class GoalsLoading extends GoalsState {}

class GoalsSuccess extends GoalsState {
  final List<GoalEntity> goals;

  GoalsSuccess(this.goals);
}

class GoalsError extends GoalsState {
  final String message;

  GoalsError(this.message);
}
