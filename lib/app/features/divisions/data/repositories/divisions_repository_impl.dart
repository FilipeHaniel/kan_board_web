import 'package:kan_board_web/app/core/exceptions/server_exception.dart';
import 'package:kan_board_web/app/core/logger/app_logger.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/divisions/data/datasources/divisions_datasource.dart';
import 'package:kan_board_web/app/features/divisions/data/models/division_model.dart';
import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';
import 'package:kan_board_web/app/features/divisions/domain/repositories/divisions_repository.dart';

class DivisionRepositoryImpl implements DivisionsRepository {
  final DivisionsDatasource _datasource;
  final AppLogger _logger;

  DivisionRepositoryImpl({
    required DivisionsDatasource datasource,
    required AppLogger logger,
  }) : _datasource = datasource,
       _logger = logger;

  @override
  Future<Result<List<DivisionEntity>>> getDivisions() async {
    try {
      final models = await _datasource.getDivisions();

      return Success(models);
    } on ServerException {
      _logger.error('Erro ao buscar divisões');
      rethrow;
    }
  }

  @override
  Future<Result<void>> createDivision({
    required DivisionEntity division,
  }) async {
    try {
      await _datasource.createDivision(
        DivisionModel(
          id: '',
          name: division.name,
          subjectId: division.subjectId,
        ),
      );

      return Success(null);
    } on ServerException {
      _logger.error('Erro ao criar divisão');
      rethrow;
    }
  }
}
