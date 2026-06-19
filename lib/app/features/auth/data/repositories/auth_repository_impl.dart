import 'package:kan_board_web/app/core/exceptions/network_exception.dart';
import 'package:kan_board_web/app/core/exceptions/unauthorized_exception.dart';
import 'package:kan_board_web/app/core/failures/network_failure.dart';
import 'package:kan_board_web/app/core/failures/unauthorized_failure.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/core/storage/auth_storage.dart';
import 'package:kan_board_web/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:kan_board_web/app/features/auth/domain/entities/user_entity.dart';
import 'package:kan_board_web/app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;
  final AuthStorage _storage;
  final AppLogger _logger;

  AuthRepositoryImpl({
    required AuthDatasource datasource,
    required AuthStorage storage,
    required AppLogger logger,
  }) : _datasource = datasource,
       _storage = storage,
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

      final token = response.accessToken;

      await _storage.saveToken(
        response.accessToken,
      );

      _logger.info('Login successful for email: $email');
      _logger.info('received token: $token');

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
  Future<Result<UserEntity>> user() async {
    try {
      _logger.info('Fetching current user');

      final user = await _datasource.user();

      return Success(user);
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
}
