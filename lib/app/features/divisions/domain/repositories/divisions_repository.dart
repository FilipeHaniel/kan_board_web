import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';

abstract class DivisionsRepository {
  Future<Result<List<DivisionEntity>>> getDivisions(String goalId);

  Future<Result<DivisionEntity>> createDivision({
    required DivisionEntity division,
  });
}
