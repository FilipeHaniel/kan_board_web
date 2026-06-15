import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:kan_board_web/app/features/auth/domain/entities/login_entity.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final HttpClient _httpClient;

  AuthDatasourceImpl({required HttpClient httpClient})
    : _httpClient = httpClient;

  @override
  Future<LoginEntity> login({
    required String email,
    required String password,
  }) async {
    final response = await _httpClient.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return LoginEntity.fromJson(response.data);
  }
}
