import 'package:get_it/get_it.dart';
import 'package:kan_board_web/app/core/http/http_client.dart';
import 'package:kan_board_web/app/features/subjects/data/datasources/subject_datasource_impl.dart';
import 'package:kan_board_web/app/features/subjects/data/datasources/subjects_datasource.dart';
import 'package:kan_board_web/app/features/subjects/data/repositories/subjects_repository_impl.dart';
import 'package:kan_board_web/app/features/subjects/domain/repositories/subjects_repository.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/create_subject_usecase.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/create_subject_usecase_impl.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/get_subjects_usecase.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/get_subjects_usecase_impl.dart';
import 'package:kan_board_web/app/features/subjects/presentation/cubit/subjects_cubit.dart';

void setupSubjectsDependencies(GetIt getIt) {
  getIt.registerLazySingleton<SubjectsDatasource>(
    () => SubjectsDatasourceImpl(
      httpClient: getIt<HttpClient>(),
    ),
  );

  getIt.registerLazySingleton<SubjectsRepository>(
    () => SubjectsRepositoryImpl(
      datasource: getIt<SubjectsDatasource>(),
    ),
  );

  getIt.registerLazySingleton<GetSubjectsUsecase>(
    () => GetSubjectsUsecaseImpl(
      repository: getIt<SubjectsRepository>(),
    ),
  );

  getIt.registerLazySingleton<CreateSubjectUsecase>(
    () => CreateSubjectUsecaseImpl(
      repository: getIt<SubjectsRepository>(),
    ),
  );

  getIt.registerFactory(
    () => SubjectsCubit(
      getSubjects: getIt<GetSubjectsUsecase>(),
      createSubject: getIt<CreateSubjectUsecase>(),
    ),
  );
}
