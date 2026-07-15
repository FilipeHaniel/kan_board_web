import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

abstract class GetGoalsUsecase {
  Future<Result<List<GoalEntity>>> call();
}
