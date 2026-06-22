import 'package:kan_board_web/app/core/exceptions/server_exception.dart';
import 'package:kan_board_web/app/core/failures/server_failure.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/goals/data/datasources/goals_datasource.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/goals/domain/repositories/goals_repository.dart';

class GoalsRepositoryImpl implements GoalsRepository {
  final GoalsDatasource _datasource;
  final AppLogger _logger;

  GoalsRepositoryImpl({
    required GoalsDatasource datasource,
    required AppLogger logger,
  }) : _datasource = datasource,
       _logger = logger;

  @override
  Future<Result<List<GoalEntity>>> getGoals() async {
    try {
      final goals = await _datasource.getGoals();

      return Success(goals);
    } on ServerException {
      _logger.error(
        'Erro ao carregar goals',
      );

      return FailureResult(
        ServerFailure(),
      );
    }
  }
}
