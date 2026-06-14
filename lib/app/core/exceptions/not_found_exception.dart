import 'package:kan_board_web/app/core/exceptions/app_exceptions.dart';

class NotFoundException extends AppException {
  NotFoundException() : super('Recurso não encontrado');
}
