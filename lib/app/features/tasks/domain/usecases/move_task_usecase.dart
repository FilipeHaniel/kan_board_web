import 'package:kan_board_web/app/core/result/result.dart';

abstract class MoveTaskUsecase {
  Future<Result<void>> call({
    required String taskId,
    required String status,
  });
}
