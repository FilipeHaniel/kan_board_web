import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/storage/auth_storage.dart';

class AuthInterceptor extends Interceptor {
  final AuthStorage storage;

  AuthInterceptor(this.storage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
