import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';

abstract interface class SubjectsRepository {
  Future<Result<List<DashboardSubjectEntity>>> getSubjects(String goalId);

  Future<Result<SubjectEntity>> createSubject(
    SubjectEntity subject,
  );
}
