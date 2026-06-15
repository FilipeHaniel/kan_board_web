import 'package:kan_board_web/app/features/auth/domain/entities/login_entity.dart';

abstract class AuthDatasource {
  Future<LoginEntity> login({
    required String email,
    required String password,
  });
}
