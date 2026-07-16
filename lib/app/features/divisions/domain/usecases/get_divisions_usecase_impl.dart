import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';
import 'package:kan_board_web/app/features/divisions/domain/repositories/divisions_repository.dart';
import 'package:kan_board_web/app/features/divisions/domain/usecases/get_divisions_usecase.dart';

class GetDivisionsUsecaseImpl implements GetDivisionsUsecase {
  final DivisionsRepository _repository;

  GetDivisionsUsecaseImpl({required DivisionsRepository repository})
    : _repository = repository;

  @override
  Future<Result<List<DivisionEntity>>> call(String goalId) async {
    return await _repository.getDivisions(goalId);
  }
}
