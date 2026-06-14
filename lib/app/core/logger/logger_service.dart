import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:logger/logger.dart';

class LoggerService implements AppLogger {
  final Logger _logger = Logger();

  @override
  void info(String message) {
    _logger.i(message);
  }

  @override
  void warning(String message) {
    _logger.w(message);
  }

  @override
  void error(
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    _logger.e(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
