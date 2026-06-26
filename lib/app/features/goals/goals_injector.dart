import 'package:get_it/get_it.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/features/goals/data/datasources/goal_datasource_impl.dart';
import 'package:kan_board_web/app/features/goals/data/datasources/goals_datasource.dart';
import 'package:kan_board_web/app/features/goals/data/repositories/goal_repository_impl.dart';
import 'package:kan_board_web/app/features/goals/domain/repositories/goals_repository.dart';
import 'package:kan_board_web/app/features/goals/domain/usecases/get_goals_usecase.dart';
import 'package:kan_board_web/app/features/goals/domain/usecases/get_goals_usecase_impl.dart';
import 'package:kan_board_web/app/features/goals/presentation/cubit/goal_cubit.dart';

void setupGoalsDependencies(GetIt getIt) {
  getIt.registerLazySingleton<GoalsDatasource>(
    () => GoalsDatasourceImpl(
      httpClient: getIt<HttpClient>(),
      logger: getIt<AppLogger>(),
    ),
  );

  getIt.registerLazySingleton<GoalsRepository>(
    () => GoalsRepositoryImpl(
      datasource: getIt<GoalsDatasource>(),
      logger: getIt<AppLogger>(),
    ),
  );

  getIt.registerLazySingleton<GetGoalsUsecase>(
    () => GetGoalsUsecaseImpl(
      repository: getIt<GoalsRepository>(),
    ),
  );

  getIt.registerFactory(
    () => GoalsCubit(
      getGoalsUsecase: getIt<GetGoalsUsecase>(),
    ),
  );
}
