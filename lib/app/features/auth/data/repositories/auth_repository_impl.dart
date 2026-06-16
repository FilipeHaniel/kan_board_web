import 'package:kan_board_web/app/core/exceptions/network_exception.dart';
import 'package:kan_board_web/app/core/exceptions/unauthorized_exception.dart';
import 'package:kan_board_web/app/core/failures/network_failure.dart';
import 'package:kan_board_web/app/core/failures/unauthorized_failure.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:kan_board_web/app/features/auth/domain/entities/user_entity.dart';
import 'package:kan_board_web/app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;
  final AppLogger _logger;

  AuthRepositoryImpl({
    required AuthDatasource datasource,
    required AppLogger logger,
  }) : _datasource = datasource,
       _logger = logger;

  @override
  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      _logger.info('Repository login');

      final response = await _datasource.login(
        email: email,
        password: password,
      );

      return Success(response.accessToken);
    } on UnauthorizedException {
      _logger.warning('Unauthorized login attempt for email: $email');
      return FailureResult(
        UnauthorizedFailure(),
      );
    } on NetworkException {
      _logger.error(
        'Network error occurred while attempting login for email: $email',
      );
      return FailureResult(
        NetworkFailure(),
      );
    }
  }

  @override
  Future<UserEntity> user() async {
    try {
      _logger.info('Fetching user information');
      return await _datasource.user();
    } on Exception catch (error) {
      _logger.error('Failed to fetch user information: $error');
      throw Exception('Failed to fetch user information: $error');
    }
  }
}
