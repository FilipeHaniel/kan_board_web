import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';
import 'package:kan_board_web/app/features/divisions/domain/usecases/create_division_usecase.dart';
import 'package:kan_board_web/app/features/divisions/domain/usecases/get_divisions_usecase.dart';

import 'divisions_state.dart';

class DivisionsCubit extends Cubit<DivisionsState> {
  final GetDivisionsUsecase _getDivisionsUsecase;
  final CreateDivisionUsecase _createDivisionUsecase;

  DivisionsCubit({
    required GetDivisionsUsecase getDivisionsUsecase,
    required CreateDivisionUsecase createDivisionUsecase,
  }) : _getDivisionsUsecase = getDivisionsUsecase,
       _createDivisionUsecase = createDivisionUsecase,
       super(DivisionsInitial());

  Future<void> loadDivisions() async {
    emit(DivisionsLoading());

    try {
      final result = await _getDivisionsUsecase();

      switch (result) {
        case Success(data: final divisions):
          emit(
            DivisionsSuccess(divisions),
          );

        case FailureResult(failure: final failure):
          emit(
            DivisionsError(failure.message),
          );
      }
    } catch (_) {
      emit(DivisionsError('Erro ao carregar frentes.'));
    }
  }

  Future<void> createDivision({required DivisionEntity division}) async {
    try {
      await _createDivisionUsecase(division: division);

      await loadDivisions();
    } catch (_) {
      emit(DivisionsError('Erro ao criar frente.'));
    }
  }
}
