import 'package:kan_board_web/app/core/exceptions/server_exception.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/features/contents/data/datasources/contents_datasource.dart';
import 'package:kan_board_web/app/features/contents/data/models/content_model.dart';

class ContentsDatasourceImpl implements ContentsDatasource {
  final HttpClient _httpClient;
  final AppLogger _logger;

  ContentsDatasourceImpl({
    required HttpClient httpClient,
    required AppLogger logger,
  }) : _httpClient = httpClient,
       _logger = logger;

  @override
  Future<List<ContentModel>> getContents(String goalId) async {
    try {
      final response = await _httpClient.get(
        '/contents',
        queryParameters: {
          'goalId': goalId,
        },
      );

      return (response as List<dynamic>)
          .map((item) => ContentModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      _logger.error('Erro ao buscar conteúdos');

      throw ServerException();
    }
  }

  @override
  Future<ContentModel> createContent(ContentModel content) async {
    try {
      final response = await _httpClient.post(
        '/contents',
        data: {
          'title': content.title,
          'divisionId': content.divisionId,
        },
      );

      return ContentModel.fromJson(response);
    } catch (_) {
      _logger.error('Erro ao criar conteúdo');

      throw ServerException();
    }
  }
}
