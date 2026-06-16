import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/storage/auth_storage.dart';

class AuthInterceptor extends Interceptor {
  final AuthStorage _storage;
  final AppLogger _logger;

  AuthInterceptor({required AuthStorage storage, required AppLogger logger})
    : _storage = storage,
      _logger = logger;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    _logger.info(
      'Info: ${options.method} ${options.path}',
    );

    _logger.debug(
      'Query: ${options.queryParameters}',
    );

    _logger.debug(
      'Body: ${options.data}',
    );

    handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    _logger.error(
      'Error: ${err.requestOptions.path}',
      error: err,
      stackTrace: err.stackTrace,
    );

    super.onError(
      err,
      handler,
    );
  }
}
