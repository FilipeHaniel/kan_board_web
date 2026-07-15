import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';

sealed class DivisionsState {}

class DivisionsInitial extends DivisionsState {}

class DivisionsLoading extends DivisionsState {}

class DivisionsSuccess extends DivisionsState {
  final List<DivisionEntity> divisions;

  DivisionsSuccess(this.divisions);
}

class DivisionsError extends DivisionsState {
  final String message;

  DivisionsError(this.message);
}
