import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:kan_board_web/app/features/dashboard/domain/usecases/get_dashboard_usecase.dart';

class GetDashboardUsecaseImpl implements GetDashboardUsecase {
  final DashboardRepository _repository;

  GetDashboardUsecaseImpl({
    required DashboardRepository repository,
  }) : _repository = repository;

  @override
  Future<List<DashboardSubjectEntity>> call({
    required String goalId,
  }) {
    return _repository.getDashboard(goalId: goalId);
  }
}
