import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/features/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:kan_board_web/app/features/dashboard/data/models/dashboard_subject_model.dart';

class DashboardDatasourceImpl implements DashboardDatasource {
  final HttpClient _httpClient;

  DashboardDatasourceImpl({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<List<DashboardSubjectModel>> getDashboard({
    required String goalId,
  }) async {
    final response = await _httpClient.get('/goals/$goalId/dashboard');

    return (response as List)
        .map((e) => DashboardSubjectModel.fromJson(e))
        .toList();
  }
}
