import 'package:kan_board_web/app/features/contents/domain/entities/content_entity.dart';

sealed class ContentsState {}

class ContentsInitial extends ContentsState {}

class ContentsLoading extends ContentsState {}

class ContentsSuccess extends ContentsState {
  final List<ContentEntity> contents;

  ContentsSuccess(this.contents);
}

class ContentsError extends ContentsState {
  final String message;

  ContentsError(this.message);
}
