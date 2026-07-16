import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/Contents/domain/entities/content_entity.dart';

abstract class CreateContentUsecase {
  Future<Result<void>> call(ContentEntity content);
}
