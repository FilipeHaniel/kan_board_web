import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/repositories/subjects_repository.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/get_subjects_usecase.dart';

class GetSubjectsUsecaseImpl implements GetSubjectsUsecase {
  final SubjectsRepository _repository;

  GetSubjectsUsecaseImpl({
    required SubjectsRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<List<SubjectEntity>>> call(String goalId) async {
    return await _repository.getSubjects(goalId);
  }
}
