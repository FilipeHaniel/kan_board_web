import 'package:kan_board_web/app/core/exceptions/server_exception.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/features/goals/data/datasources/goals_datasource.dart';
import 'package:kan_board_web/app/features/goals/data/models/goal_model.dart';

class GoalsDatasourceImpl implements GoalsDatasource {
  final HttpClient _httpClient;
  final AppLogger _logger;

  GoalsDatasourceImpl({
    required HttpClient httpClient,
    required AppLogger logger,
  }) : _httpClient = httpClient,
       _logger = logger;

  @override
  Future<List<GoalModel>> getGoals() async {
    try {
      final response = await _httpClient.get('/goals');
      _logger.info('Goals carregadas com sucesso');

      return (response as List)
          .map(
            (json) => GoalModel.fromJson(json),
          )
          .toList();
    } catch (_) {
      _logger.error('Erro ao carregar goals');

      throw ServerException();
    }
  }

  @override
  Future<void> createGoal(GoalModel goal) async {
    try {
      await _httpClient.post(
        '/goals',
        data: {
          'title': goal.title,
          'examDate': goal.examDate?.toIso8601String(),
        },
      );
      _logger.info('Goal criada com sucesso');
    } catch (_) {
      _logger.error('Erro ao criar goal');

      throw ServerException();
    }
  }
}
