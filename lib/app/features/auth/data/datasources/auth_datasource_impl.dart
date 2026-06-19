import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/exceptions/server_exception.dart';
import 'package:kan_board_web/app/core/exceptions/unauthorized_exception.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:kan_board_web/app/features/auth/data/models/login_model.dart';
import 'package:kan_board_web/app/features/auth/data/models/user_model.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final HttpClient _httpClient;
  final AppLogger _logger;

  AuthDatasourceImpl({
    required HttpClient httpClient,
    required AppLogger logger,
  }) : _httpClient = httpClient,
       _logger = logger;

  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      _logger.info('Attempting login for email: $email');

      final response = await _httpClient.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      _logger.info('Login successful for email: $email');

      _logger.info('LOGIN RESPONSE');
      _logger.info(response.toString());

      return LoginModel.fromJson(response);
    } on DioException catch (error) {
      _logger.error('Login failed for email: $email', error: error);
      if (error.response?.statusCode == 401) {
        throw UnauthorizedException();
      }

      throw ServerException();
    }
  }

  @override
  Future<UserModel> user() async {
    try {
      _logger.info('Fetching user information');

      final response = await _httpClient.get('/auth/me');

      _logger.info('User information fetched successfully');

      return UserModel.fromJson(response);
    } on Exception catch (error) {
      _logger.error('Failed to fetch user information', error: error);
      throw ServerException();
    }
  }
}
