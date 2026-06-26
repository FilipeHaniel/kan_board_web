import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/exceptions/server_exception.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/features/tasks/data/datasources/tasks_datasource.dart';
import 'package:kan_board_web/app/features/tasks/data/models/task_model.dart';

class TasksDatasourceImpl implements TasksDatasource {
  final HttpClient _httpClient;
  final AppLogger _logger;

  TasksDatasourceImpl({
    required HttpClient httpClient,
    required AppLogger logger,
  }) : _httpClient = httpClient,
       _logger = logger;

  @override
  Future<List<TaskModel>> getTasks({required String goalId}) async {
    try {
      _logger.info('Fetching tasks');

      final response = await _httpClient.get('/goals/$goalId/tasks');

      _logger.info('Tasks fetched successfully');
      // _logger.info('$response');

      final tasks = (response as List)
          .map((json) => TaskModel.fromJson(json))
          .toList();

      _logger.info(
        tasks.map((e) => e.subject).toList().toString(),
      );

      _logger.warning('${tasks.length} tasks loaded successfully');

      _logger.warning(
        'IDs: ${tasks.map((e) => e.id).toList()}',
      );

      _logger.warning(
        tasks
            .map(
              (e) => '${e.subject} | ${e.division} | ${e.title}',
            )
            .join('\n'),
      );

      return tasks;
    } on DioException catch (error) {
      _logger.error(
        'Failed to fetch tasks',
        error: error,
      );

      throw ServerException();
    }
  }

  @override
  Future<void> moveTask({
    required String taskId,
    required String status,
  }) async {
    try {
      _logger.info('Moving task $taskId to $status');

      await _httpClient.patch(
        '/tasks/$taskId/move',
        data: {
          'status': status.toUpperCase(),
        },
      );

      _logger.info('Task moved successfully');
    } on DioException catch (error, stackTrace) {
      _logger.error(
        'Status code: ${error.response?.statusCode}',
      );

      _logger.error(
        'Response body: ${error.response?.data}',
      );

      _logger.error(
        'Failed to move task',
        error: error,
        stackTrace: stackTrace,
      );
      throw ServerException();
    }
  }
}
