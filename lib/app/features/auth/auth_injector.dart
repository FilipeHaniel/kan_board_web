import 'package:get_it/get_it.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/session/app_session.dart';
import 'package:kan_board_web/app/core/storage/auth_storage.dart';
import 'package:kan_board_web/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:kan_board_web/app/features/auth/data/datasources/auth_datasource_impl.dart';
import 'package:kan_board_web/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kan_board_web/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/get_current_user_usecase_impl.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/login_usecase_impl.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/logout_usecase_impl.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/login_cubit.dart';

void setupAuthDependencies(GetIt getIt) {
  getIt.registerLazySingleton<AuthDatasource>(
    () => AuthDatasourceImpl(
      httpClient: getIt<HttpClient>(),
      logger: getIt<AppLogger>(),
    ),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      datasource: getIt<AuthDatasource>(),
      storage: getIt<AuthStorage>(),
      logger: getIt<AppLogger>(),
    ),
  );

  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecaseImpl(
      repository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetCurrentUserUsecase>(
    () => GetCurrentUserUsecaseImpl(
      repository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecaseImpl(
      repository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerFactory(
    () => LoginCubit(
      usecase: getIt<LoginUsecase>(),
      logger: getIt<AppLogger>(),
    ),
  );

  getIt.registerFactory(
    () => AuthCubit(
      storage: getIt<AuthStorage>(),
      getCurrentUserUsecase: getIt<GetCurrentUserUsecase>(),
      logoutUsecase: getIt<LogoutUsecase>(),
      session: getIt<AppSession>(),
      logger: getIt<AppLogger>(),
    ),
  );
}
