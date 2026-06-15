import 'package:dio/dio.dart';
import 'package:kan_board_web/app/core/exceptions/server_exception.dart';
import 'package:kan_board_web/app/core/exceptions/unauthorized_exception.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:kan_board_web/app/features/auth/data/models/login_model.dart';
import 'package:kan_board_web/app/features/auth/data/models/user_model.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final HttpClient _httpClient;

  AuthDatasourceImpl({required HttpClient httpClient})
    : _httpClient = httpClient;

  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _httpClient.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return LoginModel.fromJson(response.data);
    } on DioException catch (error) {
      if (error.response?.statusCode == 401) {
        throw UnauthorizedException();
      }

      throw ServerException();
    }
  }

  @override
  Future<UserModel> user() async {
    final response = await _httpClient.get('/auth/me');

    return UserModel.fromJson(response.data);
  }
}
