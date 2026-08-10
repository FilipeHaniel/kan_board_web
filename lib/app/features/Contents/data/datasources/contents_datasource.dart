import 'package:kan_board_web/app/features/contents/data/models/content_model.dart';

abstract class ContentsDatasource {
  Future<List<ContentModel>> getContents(String goalId);

  Future<ContentModel> createContent(ContentModel content);
}
