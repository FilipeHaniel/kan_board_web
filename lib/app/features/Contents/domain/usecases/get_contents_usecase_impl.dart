import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/Contents/domain/entities/content_entity.dart';
import 'package:kan_board_web/app/features/Contents/domain/repositories/contents_repository.dart';
import 'package:kan_board_web/app/features/Contents/domain/usecases/get_contents_usecase.dart';

class GetContentsUsecaseImpl implements GetContentsUsecase {
  final ContentsRepository _repository;

  GetContentsUsecaseImpl({required ContentsRepository repository})
    : _repository = repository;

  @override
  Future<Result<List<ContentEntity>>> call() {
    return _repository.getContents();
  }
}
