import 'package:kan_board_web/app/core/result/result.dart';

abstract class RegisterUsecase {
  Future<Result<void>> call({
    required String name,
    required String email,
    required String password,
  });
}
