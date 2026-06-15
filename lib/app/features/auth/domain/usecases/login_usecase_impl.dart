import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/login_usecase.dart';

class LoginUsecaseImpl implements LoginUsecase {
  final AuthRepository _repository;

  LoginUsecaseImpl({required AuthRepository repository})
    : _repository = repository;

  @override
  Future<Result<String>> call({
    required String email,
    required String password,
  }) {
    return _repository.login(
      email: email,
      password: password,
    );
  }
}
