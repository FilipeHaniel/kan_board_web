import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/exceptions/error_interceptor.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/logger/logger_interceptor.dart';
import 'package:kan_board_web/app/core/storage/auth_storage.dart';

import 'auth_interceptor.dart';

class DioFactory {
  static Dio create(
    AuthStorage storage,
    AppLogger logger,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000',
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(storage: storage, logger: logger),
      LoggerInterceptor(logger: logger),
      ErrorInterceptor(),
    ]);

    return dio;
  }
}
