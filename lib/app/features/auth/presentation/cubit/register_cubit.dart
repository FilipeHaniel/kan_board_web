import 'package:bloc/bloc.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/register_usecase.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase _usecase;
  final AppLogger _logger;

  RegisterCubit({
    required RegisterUsecase usecase,
    required AppLogger logger,
  }) : _usecase = usecase,
       _logger = logger,
       super(RegisterInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterLoading());

      final result = await _usecase(
        name: name,
        email: email,
        password: password,
      );

      switch (result) {
        case Success<void>():
          emit(RegisterSuccess());

        case FailureResult<void>():
          emit(RegisterError(result.failure.message));
      }
    } catch (error, stackTrace) {
      _logger.error(
        'Unexpected error during registration',
        error: error,
        stackTrace: stackTrace,
      );

      emit(
        RegisterError('Ocorreu um erro inesperado. Tente novamente.'),
      );
    }
  }
}
