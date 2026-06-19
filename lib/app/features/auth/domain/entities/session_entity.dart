import 'package:kan_board_web/app/features/auth/domain/entities/user_entity.dart';

class SessionEntity {
  final String token;
  final UserEntity user;

  SessionEntity({
    required this.token,
    required this.user,
  });
}
