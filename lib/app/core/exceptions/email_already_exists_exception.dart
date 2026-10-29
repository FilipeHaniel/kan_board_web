import 'package:kan_board_web/app/core/exceptions/app_exceptions.dart';

class EmailAlreadyExistsException extends AppException {
  EmailAlreadyExistsException() : super('Este e-mail já está cadastrado');
}
