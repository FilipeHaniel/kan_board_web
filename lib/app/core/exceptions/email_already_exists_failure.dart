import 'package:kan_board_web/app/core/failures/failure.dart';

class EmailAlreadyExistsFailure extends Failure {
  EmailAlreadyExistsFailure() : super('Este e-mail já está cadastrado');
}
