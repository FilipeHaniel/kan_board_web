import 'package:kan_board_web/app/features/auth/data/models/login_model.dart';
import 'package:kan_board_web/app/features/auth/data/models/user_model.dart';

abstract class AuthDatasource {
  Future<LoginModel> login({
    required String email,
    required String password,
  });

  Future<UserModel> user();
}
