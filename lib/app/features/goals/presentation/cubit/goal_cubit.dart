import 'package:bloc/bloc.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/goals/domain/usecases/get_goals_usecase.dart';
import 'package:kan_board_web/app/features/goals/presentation/cubit/goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  final GetGoalsUsecase _getGoalsUsecase;

  GoalsCubit({
    required GetGoalsUsecase getGoalsUsecase,
  }) : _getGoalsUsecase = getGoalsUsecase,
       super(GoalsInitial());

  Future<void> loadGoals() async {
    emit(GoalsLoading());

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
  }
}
