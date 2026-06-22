import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';

class DioHttpClient implements HttpClient {
  final Dio _dio;

  DioHttpClient({required Dio dio}) : _dio = dio;

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
    );

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return Map<String, dynamic>.from(response.data);
  }

  @override
  Future<Map<String, dynamic>> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.patch(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return response.data;
  }
}
