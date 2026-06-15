import 'package:kan_board_web/app/core/failures/failure.dart';

class NetworkFailure extends Failure {
  NetworkFailure() : super('Sem conexão com a rede');
}
