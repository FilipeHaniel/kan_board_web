import 'package:kan_board_web/app/core/exceptions/app_exceptions.dart';

class ForbiddenException extends AppException {
  ForbiddenException() : super('Acesso negado');
}
