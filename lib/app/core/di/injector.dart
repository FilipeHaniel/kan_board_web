import 'package:get_it/get_it.dart';
import 'package:kan_board_web/app/core/http/dio_factory.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/core/http/http_client_impl.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/logger/logger_service.dart';
import 'package:kan_board_web/app/core/session/app_session.dart';
import 'package:kan_board_web/app/core/storage/auth_storage.dart';
import 'package:kan_board_web/app/core/storage/local_auth_storage.dart';
import 'package:kan_board_web/app/features/auth/auth_injector.dart';
import 'package:kan_board_web/app/features/tasks/task_injector.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerLazySingleton<AuthStorage>(
    () => LocalAuthStorage(),
  );

  getIt.registerLazySingleton<AppLogger>(
    () => LoggerService(),
  );

  getIt.registerLazySingleton<HttpClient>(
    () => DioHttpClient(
      dio: DioFactory.create(
        getIt<AuthStorage>(),
        getIt<AppLogger>(),
      ),
    ),
  );

  getIt.registerLazySingleton(
    () => AppSession(),
  );

  setupAuthDependencies(getIt);

  setupTasksDependencies(getIt);
}
