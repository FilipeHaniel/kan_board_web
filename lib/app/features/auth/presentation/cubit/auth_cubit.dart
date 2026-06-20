import 'package:bloc/bloc.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/core/session/app_session.dart';
import 'package:kan_board_web/app/core/storage/auth_storage.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:kan_board_web/app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthStorage _storage;
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  final LogoutUsecase _logoutUsecase;
  final AppSession _session;
  final AppLogger _logger;

  AuthCubit({
    required AuthStorage storage,
    required GetCurrentUserUsecase getCurrentUserUsecase,
    required LogoutUsecase logoutUsecase,
    required AppSession session,
    required AppLogger logger,
  }) : _storage = storage,
       _getCurrentUserUsecase = getCurrentUserUsecase,
       _logoutUsecase = logoutUsecase,
       _session = session,
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
          _session.currentUser = result.data;
          emit(Authenticated(result.data));

        case FailureResult():
          await _storage.removeToken();

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
      emit(AuthLoading());

      await _logoutUsecase();

      _session.clear();

      emit(Unauthenticated());
    } catch (error, stackTrace) {
      _logger.error(
        'Failed to logout',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
