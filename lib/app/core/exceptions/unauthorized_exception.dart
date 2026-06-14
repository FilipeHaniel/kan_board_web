import 'package:kan_board_web/app/core/exceptions/app_exceptions.dart';

class UnauthorizedException extends AppException {
  UnauthorizedException() : super('Credenciais inválidas');
}
