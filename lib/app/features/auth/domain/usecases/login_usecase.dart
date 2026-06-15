import 'package:kan_board_web/app/core/result/result.dart';

abstract class LoginUsecase {
  Future<Result<String>> call({
    required String email,
    required String password,
  });
}
