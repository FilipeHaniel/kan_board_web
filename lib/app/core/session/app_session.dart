import 'package:kan_board_web/app/features/auth/domain/entities/user_entity.dart';

class AppSession {
  UserEntity? currentUser;

  bool get isAuthenticated => currentUser != null;

  void clear() => currentUser = null;
}
