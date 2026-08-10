import 'package:kan_board_web/app/core/failures/server_failure.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/contents/data/datasources/contents_datasource.dart';
import 'package:kan_board_web/app/features/contents/data/models/content_model.dart';
import 'package:kan_board_web/app/features/contents/domain/entities/content_entity.dart';
import 'package:kan_board_web/app/features/contents/domain/repositories/contents_repository.dart';

class ContentsRepositoryImpl implements ContentsRepository {
  final ContentsDatasource _datasource;

  ContentsRepositoryImpl({
    required ContentsDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Result<List<ContentEntity>>> getContents(String goalId) async {
    try {
      final result = await _datasource.getContents(goalId);

      return Success(result);
    } catch (e) {
      return FailureResult(ServerFailure());
    }
  }

  @override
  Future<Result<ContentEntity>> createContent(
    ContentEntity content,
  ) async {
    try {
      final result = await _datasource.createContent(
        ContentModel(
          id: content.id,
          title: content.title,
          status: content.status,
          position: content.position,
          divisionId: content.divisionId,
          tasks: content.tasks,
        ),
      );

      return Success(result);
    } catch (_) {
      return FailureResult(ServerFailure());
    }
  }
}
