import 'package:kan_board_web/app/core/failures/server_failure.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/subjects/data/datasources/subjects_datasource.dart';
import 'package:kan_board_web/app/features/subjects/data/model/subject_model.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/repositories/subjects_repository.dart';

class SubjectsRepositoryImpl implements SubjectsRepository {
  final SubjectsDatasource _datasource;

  SubjectsRepositoryImpl({
    required SubjectsDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Result<List<SubjectEntity>>> getSubjects(
    String goalId,
  ) async {
    try {
      final result = await _datasource.getSubjects(goalId);

      return Success(result);
    } catch (_) {
      return FailureResult(ServerFailure());
    }
  }

  @override
  Future<Result<SubjectEntity>> createSubject(
    SubjectEntity subject,
  ) async {
    try {
      final result = await _datasource.createSubject(
        SubjectModel(
          id: subject.id,
          name: subject.name,
          goalId: subject.goalId,
        ),
      );

      return Success(result);
    } catch (_) {
      return FailureResult(
        ServerFailure(),
      );
    }
  }
}
