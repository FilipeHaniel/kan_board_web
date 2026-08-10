import 'package:get_it/get_it.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/features/contents/data/datasources/contents_datasource.dart';
import 'package:kan_board_web/app/features/contents/data/datasources/contents_datasource_impl.dart';
import 'package:kan_board_web/app/features/contents/data/repositories/contents_repository_impl.dart';
import 'package:kan_board_web/app/features/contents/domain/repositories/contents_repository.dart';
import 'package:kan_board_web/app/features/contents/domain/usecases/create_content_usecase.dart';
import 'package:kan_board_web/app/features/contents/domain/usecases/create_content_usecase_impl.dart';
import 'package:kan_board_web/app/features/contents/domain/usecases/get_contents_usecase.dart';
import 'package:kan_board_web/app/features/contents/domain/usecases/get_contents_usecase_impl.dart';
import 'package:kan_board_web/app/features/contents/presentation/cubit/contents_cubit.dart';

void setupContentsDependencies(GetIt getIt) {
  getIt.registerLazySingleton<ContentsDatasource>(
    () => ContentsDatasourceImpl(
      httpClient: getIt<HttpClient>(),
      logger: getIt(),
    ),
  );

  getIt.registerLazySingleton<ContentsRepository>(
    () => ContentsRepositoryImpl(
      datasource: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetContentsUsecase>(
    () => GetContentsUsecaseImpl(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton<CreateContentUsecase>(
    () => CreateContentUsecaseImpl(
      repository: getIt(),
    ),
  );

  getIt.registerFactory(
    () => ContentsCubit(
      getContentsUsecase: getIt(),
      createContentUsecase: getIt(),
    ),
  );
}
