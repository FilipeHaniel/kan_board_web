import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

abstract class GoalsRepository {
  Future<Result<List<GoalEntity>>> getGoals();
}
