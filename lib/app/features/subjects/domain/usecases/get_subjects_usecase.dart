import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';

abstract class GetSubjectsUsecase {
  Future<Result<List<DashboardSubjectEntity>>> call(String goalId);
}
