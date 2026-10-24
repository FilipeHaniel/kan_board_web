import 'package:kan_board_web/app/features/contents/domain/entities/content_entity.dart';
import 'package:kan_board_web/app/features/tasks/data/models/task_model.dart';

class ContentModel extends ContentEntity {
  const ContentModel({
    required super.id,
    required super.title,
    required super.status,
    required super.position,
    required super.subjectId,
    required super.tasks,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      id: json['id'],
      title: json['title'],
      status: json['status'],
      position: json['position'],
      subjectId: json['subjectId'],
      tasks: (json['tasks'] as List).map((e) => TaskModel.fromJson(e)).toList(),
    );
  }
}
