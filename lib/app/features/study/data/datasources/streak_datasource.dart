import 'package:dio/dio.dart';

class StreakDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000',
    ),
  );

  Future<int> getStreak() async {
    final response = await dio.get('/streak');

    return response.data['streak'];
  }
}
