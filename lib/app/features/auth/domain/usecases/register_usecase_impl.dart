import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/register_usecase.dart';

class RegisterUsecaseImpl implements RegisterUsecase {
  final AuthRepository _repository;

  RegisterUsecaseImpl({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<void>> call({
    required String name,
    required String email,
    required String password,
  }) {
    return _repository.register(
      name: name,
      email: email,
      password: password,
    );
  }
}
