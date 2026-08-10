import 'package:kan_board_web/app/core/result/result.dart';
import '../entities/content_entity.dart';

abstract class ContentsRepository {
  Future<Result<List<ContentEntity>>> getContents(String goalId);

  Future<Result<ContentEntity>> createContent(ContentEntity content);
}
