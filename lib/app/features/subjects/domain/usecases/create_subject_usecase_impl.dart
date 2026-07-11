import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/repositories/subjects_repository.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/create_subject_usecase.dart';

class CreateSubjectUsecaseImpl implements CreateSubjectUsecase {
  final SubjectsRepository _repository;

  CreateSubjectUsecaseImpl({
    required SubjectsRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<void>> call(SubjectEntity subject) {
    return _repository.createSubject(subject);
  }
}
