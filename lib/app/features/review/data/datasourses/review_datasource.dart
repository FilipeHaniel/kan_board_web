import 'package:dio/dio.dart';

class ReviewDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000',
    ),
  );

  Future<List<dynamic>> getPendingReviews() async {
    final response = await dio.get(
      '/reviews/pending',
    );

    return response.data;
  }
}
