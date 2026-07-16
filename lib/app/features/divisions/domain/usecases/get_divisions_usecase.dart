import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';

abstract class GetDivisionsUsecase {
  Future<Result<List<DivisionEntity>>> call(String goalId);
}
