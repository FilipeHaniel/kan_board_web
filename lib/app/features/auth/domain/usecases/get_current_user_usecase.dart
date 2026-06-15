import 'package:kan_board_web/app/features/auth/domain/entities/user_entity.dart';

abstract class GetCurrentUserUsecase {
  Future<UserEntity> call();
}
