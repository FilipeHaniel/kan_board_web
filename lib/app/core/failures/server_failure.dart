import 'package:kan_board_web/app/core/failures/failure.dart';

class ServerFailure extends Failure {
  ServerFailure()
    : super('Não foi possível concluir a operação. Tente novamente.');
}
