import 'package:kan_board_web/app/core/result/result.dart';
import '../entities/content_entity.dart';

abstract class ContentsRepository {
  Future<Result<List<ContentEntity>>> getContents();

  Future<Result<void>> createContent(
    ContentEntity content,
  );
}
