import 'package:kan_board_web/app/features/goals/data/models/goal_model.dart';

abstract class GoalsDatasource {
  Future<List<GoalModel>> getGoals();
}
