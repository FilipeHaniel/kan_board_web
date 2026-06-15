import 'package:kan_board_web/app/core/failures/failure.dart';

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure() : super('Usuário não autenticado');
}
