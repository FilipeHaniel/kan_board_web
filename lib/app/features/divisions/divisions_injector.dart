import 'package:get_it/get_it.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/features/divisions/data/datasources/divisions_datasource.dart';
import 'package:kan_board_web/app/features/divisions/data/datasources/divisions_datasource_impl.dart';
import 'package:kan_board_web/app/features/divisions/data/repositories/divisions_repository_impl.dart';
import 'package:kan_board_web/app/features/divisions/domain/repositories/divisions_repository.dart';
import 'package:kan_board_web/app/features/divisions/domain/usecases/create_division_usecase.dart';
import 'package:kan_board_web/app/features/divisions/domain/usecases/create_division_usecase_impl.dart';
import 'package:kan_board_web/app/features/divisions/domain/usecases/get_divisions_usecase.dart';
import 'package:kan_board_web/app/features/divisions/domain/usecases/get_divisions_usecase_impl.dart';
import 'package:kan_board_web/app/features/divisions/presentation/cubit/divisions_cubit.dart';

void setupDivisionsDependencies(GetIt getIt) {
  getIt.registerLazySingleton<DivisionsDatasource>(
    () => DivisionsDatasourceImpl(
      httpClient: getIt<HttpClient>(),
    ),
  );

  getIt.registerLazySingleton<DivisionsRepository>(
    () => DivisionsRepositoryImpl(
      datasource: getIt(),
      logger: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetDivisionsUsecase>(
    () => GetDivisionsUsecaseImpl(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<CreateDivisionUsecase>(
    () => CreateDivisionUsecaseImpl(
      repository: getIt(),
    ),
  );

  getIt.registerFactory(
    () => DivisionsCubit(
      getDivisionsUsecase: getIt(),
      createDivisionUsecase: getIt(),
    ),
  );
}
