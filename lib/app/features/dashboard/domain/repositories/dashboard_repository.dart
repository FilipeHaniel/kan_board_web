import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';

abstract class DashboardRepository {
  Future<List<DashboardSubjectEntity>> getDashboard({
    required String goalId,
  });
}
