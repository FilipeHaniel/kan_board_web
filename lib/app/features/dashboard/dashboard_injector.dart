import 'package:get_it/get_it.dart';
import 'package:kan_board_web/app/features/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:kan_board_web/app/features/dashboard/data/datasource/dashboard_datasource_impl.dart';
import 'package:kan_board_web/app/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:kan_board_web/app/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:kan_board_web/app/features/dashboard/domain/usecases/get_dashboard_usecase.dart';
import 'package:kan_board_web/app/features/dashboard/domain/usecases/get_dashboard_usecase_impl.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_cubit.dart';

void setupDashboardDependencies(GetIt getIt) {
  getIt.registerLazySingleton<DashboardDatasource>(
    () => DashboardDatasourceImpl(
      httpClient: getIt(),
    ),
  );

  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      datasource: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetDashboardUsecase>(
    () => GetDashboardUsecaseImpl(repository: getIt()),
  );

  getIt.registerFactory(
    () => DashboardCubit(
      getDashboard: getIt(),
      moveTask: getIt(),
      createSubject: getIt(),
      createDivision: getIt(),
    ),
  );
}
