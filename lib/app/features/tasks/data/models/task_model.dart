import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    required super.status,
    required super.subject,
    required super.division,
    required super.content,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      status: json['status'].toString().toLowerCase(),
      subject: json['subject'],
      division: json['division'],
      content: json['content'],
    );
  }
}
