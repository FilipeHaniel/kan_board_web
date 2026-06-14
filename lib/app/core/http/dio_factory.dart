import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/storage/auth_storage.dart';

import 'auth_interceptor.dart';

class DioFactory {
  static Dio create(AuthStorage storage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000',
      ),
    );

    dio.interceptors.add(
      AuthInterceptor(storage: storage),
    );

    return dio;
  }
}
