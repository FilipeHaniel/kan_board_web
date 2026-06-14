import 'package:kan_board_web/app/core/exceptions/app_exceptions.dart';

class NetworkException extends AppException {
  NetworkException() : super('Erro de conexão');
}
