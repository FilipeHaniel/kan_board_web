import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';

class LoggerInterceptor extends Interceptor {
  final AppLogger _logger;

  LoggerInterceptor({required AppLogger logger}) : _logger = logger;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    _logger.info(
      '[REQUEST] ${options.method} ${options.path}',
    );

    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    _logger.info(
      '[RESPONSE] ${response.statusCode} ${response.requestOptions.path}',
    );

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    _logger.error(
      '[ERROR] ${err.requestOptions.path}',
      err,
      err.stackTrace,
    );

    handler.next(err);
  }
}
