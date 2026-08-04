import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';
import 'package:kan_board_web/app/features/divisions/domain/repositories/divisions_repository.dart';
import 'package:kan_board_web/app/features/divisions/domain/usecases/create_division_usecase.dart';

class CreateDivisionUsecaseImpl implements CreateDivisionUsecase {
  final DivisionsRepository _repository;

  CreateDivisionUsecaseImpl({required DivisionsRepository repository})
    : _repository = repository;

  @override
  Future<Result<DivisionEntity>> call({
    required DivisionEntity division,
  }) async {
    return await _repository.createDivision(division: division);
  }
}
