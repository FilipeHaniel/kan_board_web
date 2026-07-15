import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';

abstract class CreateDivisionUsecase {
  Future<Result<void>> call({required DivisionEntity division});
}
