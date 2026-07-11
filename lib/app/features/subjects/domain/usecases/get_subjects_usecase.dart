import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';

abstract class GetSubjectsUsecase {
  Future<Result<List<SubjectEntity>>> call(String goalId);
}
