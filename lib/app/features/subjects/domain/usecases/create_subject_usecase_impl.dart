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
  Future<Result<SubjectEntity>> call({required SubjectEntity subject}) async {
    return await _repository.createSubject(subject);
  }
}
