import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';

abstract class SubjectsState {}

class SubjectsInitial extends SubjectsState {}

class SubjectsLoading extends SubjectsState {}

class SubjectsSuccess extends SubjectsState {
  final List<DashboardSubjectEntity> subjects;

  SubjectsSuccess(this.subjects);
}

class SubjectsEmpty extends SubjectsState {}

class SubjectsError extends SubjectsState {
  final String message;

  SubjectsError(this.message);
}
