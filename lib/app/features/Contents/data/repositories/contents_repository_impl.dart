import 'package:kan_board_web/app/core/failures/server_failure.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/Contents/data/datasources/contents_datasource.dart';
import 'package:kan_board_web/app/features/Contents/data/models/content_model.dart';
import 'package:kan_board_web/app/features/Contents/domain/entities/content_entity.dart';
import 'package:kan_board_web/app/features/Contents/domain/repositories/contents_repository.dart';

class ContentsRepositoryImpl implements ContentsRepository {
  final ContentsDatasource _datasource;

  ContentsRepositoryImpl({
    required ContentsDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Result<List<ContentEntity>>> getContents() async {
    try {
      final result = await _datasource.getContents();

      return Success(result);
    } catch (e) {
      return FailureResult(ServerFailure());
    }
  }

  @override
  Future<Result<void>> createContent(
    ContentEntity content,
  ) async {
    try {
      await _datasource.createContent(
        ContentModel(
          id: content.id,
          title: content.title,
          status: content.status,
          position: content.position,
          divisionId: content.divisionId,
          tasks: content.tasks,
        ),
      );

      return const Success(null);
    } catch (_) {
      return FailureResult(ServerFailure());
    }
  }
}
