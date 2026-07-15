import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/goals/domain/repositories/goals_repository.dart';
import 'package:kan_board_web/app/features/goals/domain/usecases/get_goals_usecase.dart';

class GetGoalsUsecaseImpl implements GetGoalsUsecase {
  final GoalsRepository _repository;

  GetGoalsUsecaseImpl({required GoalsRepository repository})
    : _repository = repository;

  @override
  Future<Result<List<GoalEntity>>> call() {
    return _repository.getGoals();
  }
}
