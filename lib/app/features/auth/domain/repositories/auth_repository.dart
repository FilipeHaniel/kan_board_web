import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<String>> login({
    required String email,
    required String password,
  });

  Future<Result<UserEntity>> user();
}
