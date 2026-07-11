import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';

abstract interface class SubjectsRepository {
  Future<Result<List<SubjectEntity>>> getSubjects(String goalId);

  Future<Result<void>> createSubject(
    SubjectEntity subject,
  );
}
