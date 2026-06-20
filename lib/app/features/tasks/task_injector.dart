import 'package:get_it/get_it.dart';
import 'package:kan_board_web/app/features/tasks/data/datasources/tasks_datasource.dart';
import 'package:kan_board_web/app/features/tasks/data/datasources/tasks_datasource_impl.dart';
import 'package:kan_board_web/app/features/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:kan_board_web/app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/get_tasks_usecase_impl.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/move_task_usecase.dart';
import 'package:kan_board_web/app/features/tasks/domain/usecases/move_task_usecase_impl.dart';
import 'package:kan_board_web/app/features/tasks/presentation/cubit/tasks_cubit.dart';

void setupTasksDependencies(GetIt getIt) {
  getIt.registerLazySingleton<TasksDatasource>(
    () => TasksDatasourceImpl(
      httpClient: getIt(),
      logger: getIt(),
    ),
  );

  getIt.registerLazySingleton<TasksRepository>(
    () => TasksRepositoryImpl(
      datasource: getIt(),
      logger: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetTasksUsecase>(
    () => GetTasksUsecaseImpl(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<MoveTaskUsecase>(
    () => MoveTaskUsecaseImpl(
      repository: getIt(),
    ),
  );

  getIt.registerFactory(
    () => TasksCubit(
      getTasksUsecase: getIt(),
      moveTaskUsecase: getIt(),
      logger: getIt(),
    ),
  );
}
