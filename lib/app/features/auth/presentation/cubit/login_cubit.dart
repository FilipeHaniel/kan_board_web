import 'package:bloc/bloc.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _usecase;
  final AppLogger _logger;

  LoginCubit({required LoginUsecase usecase, required AppLogger logger})
    : _usecase = usecase,
      _logger = logger,
      super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      _logger.info('Login attempt for email: $email');

      final result = await _usecase(
        email: email,
        password: password,
      );

      _logger.info('Login result for email: $email - $result');

      switch (result) {
        case Success():
          _logger.info('Login successful for email: $email');
          emit(LoginSuccess());

          return;

        case FailureResult():
          _logger.error('Login failed for email: $email');
          emit(
            LoginError(result.failure.message),
          );

          return;
      }
    } catch (error, stackTrace) {
      _logger.error(
        'unexpected error during login for email: $email',
        error: error,
        stackTrace: stackTrace,
      );

      emit(LoginError('An unexpected error occurred. Please try again.'));
    }
  }
}
