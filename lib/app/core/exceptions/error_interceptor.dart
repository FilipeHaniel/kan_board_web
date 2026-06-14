import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/exceptions/forbidden_exception.dart';
import 'package:kan_board_web/app/core/exceptions/network_exception.dart';
import 'package:kan_board_web/app/core/exceptions/not_found_exception.dart';
import 'package:kan_board_web/app/core/exceptions/server_exception.dart';
import 'package:kan_board_web/app/core/exceptions/unauthorized_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    switch (err.response?.statusCode) {
      case 401:
        throw UnauthorizedException();

      case 403:
        throw ForbiddenException();

      case 404:
        throw NotFoundException();

      case 500:
        throw ServerException();

      default:
        throw NetworkException();
    }
  }
}
