import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/contents/domain/entities/content_entity.dart';
import 'package:kan_board_web/app/features/contents/domain/repositories/contents_repository.dart';
import 'package:kan_board_web/app/features/contents/domain/usecases/create_content_usecase.dart';

class CreateContentUsecaseImpl implements CreateContentUsecase {
  final ContentsRepository _repository;

  CreateContentUsecaseImpl({required ContentsRepository repository})
    : _repository = repository;

  @override
  Future<Result<ContentEntity>> call(ContentEntity content) async {
    return _repository.createContent(content);
  }
}
