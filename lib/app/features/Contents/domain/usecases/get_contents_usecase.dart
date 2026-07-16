import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/Contents/domain/entities/content_entity.dart';

abstract class GetContentsUsecase {
  Future<Result<List<ContentEntity>>> call(String goalId);
}
