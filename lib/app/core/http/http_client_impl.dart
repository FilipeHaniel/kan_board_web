import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';

class HttpClientImpl implements HttpClient {
  final Dio _dio;

  HttpClientImpl({required Dio dio}) : _dio = dio;

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
    );

    return response.data;
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
    );

    return response.data;
  }

  @override
  Future<dynamic> delete(String path) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> patch(String path, {data}) {
    // TODO: implement patch
    throw UnimplementedError();
  }
}
