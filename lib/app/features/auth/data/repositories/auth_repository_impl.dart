import 'package:kan_board_web/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:kan_board_web/app/features/auth/domain/entities/user_entity.dart';
import 'package:kan_board_web/app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl({required AuthDatasource datasource})
    : _datasource = datasource;

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    final response = await _datasource.login(
      email: email,
      password: password,
    );

    return response.accessToken;
  }

  @override
  Future<UserEntity> user() async {
    return await _datasource.user();
  }
}
