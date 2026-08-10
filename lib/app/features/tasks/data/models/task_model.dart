import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    required super.status,
    super.subject,
    super.division,
    super.content,
    required super.position,
    super.estimatedMinutes,
    required super.contentId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      status: json['status'].toString().toUpperCase(),
      subject: json['subject'],
      division: json['division'],
      content: json['content'],
      position: json['position'],
      estimatedMinutes: json['estimatedMinutes'],
      contentId: json['contentId'],
    );
  }
}
