import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';

abstract class GetDashboardUsecase {
  Future<List<DashboardSubjectEntity>> call({
    required String goalId,
  });
}
