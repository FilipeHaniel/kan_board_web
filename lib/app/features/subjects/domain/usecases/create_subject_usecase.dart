import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';

abstract class CreateSubjectUsecase {
  Future<Result<SubjectEntity>> call(SubjectEntity subject);
}
