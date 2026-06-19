import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/auth/domain/entities/user_entity.dart';
import 'package:kan_board_web/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/get_current_user_usecase.dart';

class GetCurrentUserUsecaseImpl implements GetCurrentUserUsecase {
  final AuthRepository _repository;

  GetCurrentUserUsecaseImpl({required AuthRepository repository})
    : _repository = repository;

  @override
  Future<Result<UserEntity>> call() {
    return _repository.user();
  }
}
