import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/features/subjects/data/datasources/subjects_datasource.dart';
import 'package:kan_board_web/app/features/subjects/data/model/subject_model.dart';

class SubjectsDatasourceImpl implements SubjectsDatasource {
  final HttpClient _httpClient;

  SubjectsDatasourceImpl({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<List<SubjectModel>> getSubjects(String goalId) async {
    final response = await _httpClient.get(
      '/subjects',
      queryParameters: {
        'goalId': goalId,
      },
    );

    return (response as List).map((e) => SubjectModel.fromJson(e)).toList();
  }

  @override
  Future<void> createSubject(SubjectModel subject) async {
    await _httpClient.post(
      '/subjects',
      data: subject.toJson(),
    );
  }
}
