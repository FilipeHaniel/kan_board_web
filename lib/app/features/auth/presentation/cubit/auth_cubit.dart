import 'package:kan_board_web/app/core/storage/auth_storage.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/login_usecase.dart';

class AuthCubit {
  final LoginUsecase _loginUsecase;
  final AuthStorage _authStorage;

  AuthCubit({
    required LoginUsecase loginUsecase,
    required AuthStorage authStorage,
  }) : _loginUsecase = loginUsecase,
       _authStorage = authStorage;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final token = await _loginUsecase(
      email: email,
      password: password,
    );

    await _authStorage.saveToken(token);
  }
}
