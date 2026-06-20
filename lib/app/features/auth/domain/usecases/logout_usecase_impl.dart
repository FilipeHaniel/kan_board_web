import 'package:kan_board_web/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/logout_usecase.dart';

class LogoutUsecaseImpl implements LogoutUsecase {
  final AuthRepository _repository;

  LogoutUsecaseImpl({required AuthRepository repository})
    : _repository = repository;

  @override
  Future<void> call() {
    return _repository.logout();
  }
}
