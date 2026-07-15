import 'package:bloc/bloc.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/goals/domain/usecases/create_goal_usecase.dart';
import 'package:kan_board_web/app/features/goals/domain/usecases/get_goals_usecase.dart';
import 'package:kan_board_web/app/features/goals/presentation/cubit/goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  final GetGoalsUsecase _getGoalsUsecase;
  final CreateGoalUsecase _createGoalUsecase;

  GoalsCubit({
    required GetGoalsUsecase getGoalsUsecase,
    required CreateGoalUsecase createGoalUsecase,
  }) : _getGoalsUsecase = getGoalsUsecase,
       _createGoalUsecase = createGoalUsecase,
       super(GoalsInitial());

  Future<void> loadGoals() async {
    emit(GoalsLoading());

    try {
      final result = await _getGoalsUsecase();

      switch (result) {
        case Success(data: final goals):
          emit(
            GoalsSuccess(goals),
          );

        case FailureResult(failure: final failure):
          emit(
            GoalsError(failure.message),
          );
      }
    } catch (_) {
      emit(GoalsError('Erro ao carregar metas.'));
    }
  }

  Future<void> createGoal({required GoalEntity goal}) async {
    final result = await _createGoalUsecase(goal);

    switch (result) {
      case Success():
        loadGoals();

      case FailureResult(failure: final failure):
        emit(GoalsError(failure.message));
    }
  }
}
