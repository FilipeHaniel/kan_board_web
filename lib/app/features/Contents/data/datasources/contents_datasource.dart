import 'package:kan_board_web/app/features/Contents/data/models/content_model.dart';

abstract class ContentsDatasource {
  Future<List<ContentModel>> getContents();

  Future<void> createContent(
    ContentModel content,
  );
}
