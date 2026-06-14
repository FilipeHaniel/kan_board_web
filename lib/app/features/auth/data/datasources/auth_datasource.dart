import 'package:dio/dio.dart';
import 'package:kan_board_web/app/features/auth/domain/entities/auth_user.dart';

class AuthDatasource {
  final Dio _dio;

  AuthDatasource({required Dio dio}) : _dio = dio;

  Future<AuthUser> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return AuthUser.fromJson(response.data);
  }
}
