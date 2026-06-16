import 'package:bloc/bloc.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  final AppLogger _logger;

  AppBlocObserver({required AppLogger logger}) : _logger = logger;

  @override
  void onChange(
    BlocBase bloc,
    Change change,
  ) {
    _logger.debug(
      '${bloc.runtimeType}: '
      '${change.currentState} -> '
      '${change.nextState}',
    );

    super.onChange(
      bloc,
      change,
    );
  }

  @override
  void onError(
    BlocBase bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    _logger.error(
      'Erro em ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
    );

    super.onError(
      bloc,
      error,
      stackTrace,
    );
  }

  @override
  void onClose(BlocBase bloc) {
    _logger.info(
      '[BLOC CLOSED] ${bloc.runtimeType}',
    );

    super.onClose(bloc);
  }
}
