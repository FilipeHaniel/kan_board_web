import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';

abstract class SubjectsState {}

class SubjectsInitial extends SubjectsState {}

class SubjectsLoading extends SubjectsState {}

class SubjectsSuccess extends SubjectsState {
  final List<SubjectEntity> subjects;

  SubjectsSuccess(this.subjects);
}

class SubjectsError extends SubjectsState {
  final String message;

  SubjectsError(this.message);
}
