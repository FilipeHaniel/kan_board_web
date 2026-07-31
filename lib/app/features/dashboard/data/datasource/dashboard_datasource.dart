import 'package:kan_board_web/app/features/dashboard/data/models/dashboard_subject_model.dart';

abstract class DashboardDatasource {
  Future<List<DashboardSubjectModel>> getDashboard({
    required String goalId,
  });
}
