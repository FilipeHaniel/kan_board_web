import 'package:bloc/bloc.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/core/storage/auth_storage.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthStorage _storage;
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  final AppLogger _logger;

  AuthCubit({
    required AuthStorage storage,
    required GetCurrentUserUsecase getCurrentUserUsecase,
    required AppLogger logger,
  }) : _storage = storage,
       _getCurrentUserUsecase = getCurrentUserUsecase,
       _logger = logger,
       super(AuthInitial());

  Future<void> checkAuth() async {
    try {
      emit(AuthLoading());

      final token = await _storage.getToken();

      if (token == null || token.isEmpty) {
        emit(Unauthenticated());

        return;
      }

      final result = await _getCurrentUserUsecase();

      switch (result) {
        case Success():
          emit(
            Authenticated(result.data),
          );

        case FailureResult():
          await _storage.clear();

          emit(Unauthenticated());
      }
    } catch (error, stackTrace) {
      _logger.error(
        'Auth check failed',
        error: error,
        stackTrace: stackTrace,
      );

      emit(Unauthenticated());
    }
  }

  Future<void> logout() async {
    try {
      await _storage.clear();

      emit(
        Unauthenticated(),
      );
    } catch (error, stackTrace) {
      _logger.error(
        'Failed to logout',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
