import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/goals/domain/repositories/goals_repository.dart';
import 'package:kan_board_web/app/features/goals/domain/usecases/create_goal_usecase.dart';

class CreateGoalUsecaseImpl implements CreateGoalUsecase {
  final GoalsRepository _repository;

  CreateGoalUsecaseImpl({required GoalsRepository repository})
    : _repository = repository;

  @override
  Future<Result<void>> call(GoalEntity goal) {
    return _repository.createGoal(goal);
  }
}
