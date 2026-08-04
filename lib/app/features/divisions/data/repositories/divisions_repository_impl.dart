import 'package:kan_board_web/app/core/exceptions/server_exception.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/divisions/data/datasources/divisions_datasource.dart';
import 'package:kan_board_web/app/features/divisions/data/models/division_model.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';
import 'package:kan_board_web/app/features/divisions/domain/repositories/divisions_repository.dart';

class DivisionsRepositoryImpl implements DivisionsRepository {
  final DivisionsDatasource _datasource;
  final AppLogger _logger;

  DivisionsRepositoryImpl({
    required DivisionsDatasource datasource,
    required AppLogger logger,
  }) : _datasource = datasource,
       _logger = logger;

  @override
  Future<Result<List<DivisionEntity>>> getDivisions(String goalId) async {
    try {
      final models = await _datasource.getDivisions(goalId);

      return Success(models);
    } on ServerException {
      _logger.error('Erro ao buscar divisões');
      rethrow;
    }
  }

  @override
  Future<Result<DivisionEntity>> createDivision({
    required DivisionEntity division,
  }) async {
    try {
      final result = await _datasource.createDivision(
        DivisionModel(
          id: '',
          name: division.name,
          subjectId: division.subjectId,
        ),
      );

      return Success(result);
    } on ServerException {
      _logger.error('Erro ao criar divisão');
      rethrow;
    }
  }
}
