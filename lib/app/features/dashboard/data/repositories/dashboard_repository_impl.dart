import 'package:kan_board_web/app/features/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardDatasource _datasource;

  DashboardRepositoryImpl({
    required DashboardDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<List<DashboardSubjectEntity>> getDashboard({
    required String goalId,
  }) {
    return _datasource.getDashboard(goalId: goalId);
  }
}
