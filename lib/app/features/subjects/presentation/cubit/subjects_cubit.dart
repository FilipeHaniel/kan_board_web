import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/create_subject_usecase.dart';
import 'package:kan_board_web/app/features/subjects/domain/usecases/get_subjects_usecase.dart';
import 'package:kan_board_web/app/features/subjects/presentation/cubit/subjects_state.dart';

class SubjectsCubit extends Cubit<SubjectsState> {
  final GetSubjectsUsecase _getSubjects;
  final CreateSubjectUsecase _createSubject;

  SubjectsCubit({
    required GetSubjectsUsecase getSubjects,
    required CreateSubjectUsecase createSubject,
  }) : _getSubjects = getSubjects,
       _createSubject = createSubject,
       super(SubjectsInitial());

  Future<void> loadSubjects(String goalId) async {
    emit(SubjectsLoading());

    final result = await _getSubjects(goalId);

    switch (result) {
      case Success(data: final subjects):
        emit(SubjectsSuccess(subjects));

      case FailureResult(failure: final failure):
        emit(SubjectsError(failure.message));
    }
  }

  Future<void> createSubject(SubjectEntity subject) async {
    final result = await _createSubject(subject);

    switch (result) {
      case Success():
        loadSubjects(subject.goalId);

      case FailureResult(failure: final failure):
        emit(SubjectsError(failure.message));
    }
  }
}
