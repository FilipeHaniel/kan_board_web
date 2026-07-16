import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/result/result.dart';
import 'package:kan_board_web/app/features/Contents/domain/entities/content_entity.dart';
import 'package:kan_board_web/app/features/Contents/domain/usecases/create_content_usecase.dart';
import 'package:kan_board_web/app/features/Contents/domain/usecases/get_contents_usecase.dart';
import 'package:kan_board_web/app/features/Contents/presentation/cubit/contents_state.dart';

class ContentsCubit extends Cubit<ContentsState> {
  final GetContentsUsecase _getContentsUsecase;
  final CreateContentUsecase _createContentUsecase;

  ContentsCubit({
    required GetContentsUsecase getContentsUsecase,
    required CreateContentUsecase createContentUsecase,
  }) : _getContentsUsecase = getContentsUsecase,
       _createContentUsecase = createContentUsecase,
       super(ContentsInitial());

  Future<void> loadContents() async {
    emit(ContentsLoading());

    final result = await _getContentsUsecase();

    switch (result) {
      case Success(data: final contents):
        emit(
          ContentsSuccess(contents),
        );

      case FailureResult(failure: final failure):
        emit(
          ContentsError(failure.message),
        );
    }
  }

  Future<void> createContent(ContentEntity content) async {
    final result = await _createContentUsecase(content);

    switch (result) {
      case Success():
        loadContents();

      case FailureResult(failure: final failure):
        emit(
          ContentsError(failure.message),
        );
    }
  }
}
