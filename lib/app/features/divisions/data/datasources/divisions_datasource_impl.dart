import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/features/divisions/data/datasources/divisions_datasource.dart';
import 'package:kan_board_web/app/features/divisions/data/models/division_model.dart';

class DivisionsDatasourceImpl implements DivisionsDatasource {
  final HttpClient _httpClient;

  DivisionsDatasourceImpl({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<List<DivisionModel>> getDivisions(String goalId) async {
    final response = await _httpClient.get(
      '/divisions',
      queryParameters: {
        'goalId': goalId,
      },
    );

    return (response as List).map((e) => DivisionModel.fromJson(e)).toList();
  }

  @override
  Future<DivisionModel> createDivision(DivisionModel division) async {
    final response = await _httpClient.post(
      '/divisions',
      data: division.toJson(),
    );

    return DivisionModel.fromJson(response);
  }
}
