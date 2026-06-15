import 'package:kan_board_web/app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<String> login({
    required String email,
    required String password,
  });

  Future<UserEntity> user();
}
