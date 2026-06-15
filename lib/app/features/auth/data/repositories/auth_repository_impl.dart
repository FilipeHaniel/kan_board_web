import 'package:kan_board_web/app/core/exceptions/network_exception.dart';
import 'package:kan_board_web/app/core/exceptions/unauthorized_exception.dart';
import 'package:kan_board_web/app/core/failures/network_failure.dart';
import 'package:kan_board_web/app/core/failures/unauthorized_failure.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:kan_board_web/app/features/auth/domain/entities/user_entity.dart';
import 'package:kan_board_web/app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl({required AuthDatasource datasource})
    : _datasource = datasource;

  @override
  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _datasource.login(
        email: email,
        password: password,
      );

      return Success(response.accessToken);
    } on UnauthorizedException {
      return FailureResult(
        UnauthorizedFailure(),
      );
    } on NetworkException {
      return FailureResult(
        NetworkFailure(),
      );
    }
  }

  @override
  Future<UserEntity> user() async {
    return await _datasource.user();
  }
}
