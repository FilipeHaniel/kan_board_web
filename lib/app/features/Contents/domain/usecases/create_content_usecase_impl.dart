import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/Contents/domain/entities/content_entity.dart';
import 'package:kan_board_web/app/features/Contents/domain/repositories/contents_repository.dart';
import 'package:kan_board_web/app/features/Contents/domain/usecases/create_content_usecase.dart';

class CreateContentUsecaseImpl implements CreateContentUsecase {
  final ContentsRepository _repository;

  CreateContentUsecaseImpl({required ContentsRepository repository})
    : _repository = repository;

  @override
  Future<Result<void>> call(ContentEntity content) async {
    return _repository.createContent(content);
  }
}
