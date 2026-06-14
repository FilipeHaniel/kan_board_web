import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/storage/auth_storage.dart';

class AuthInterceptor extends Interceptor {
  final AuthStorage _storage;

  AuthInterceptor({required AuthStorage storage}) : _storage = storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
