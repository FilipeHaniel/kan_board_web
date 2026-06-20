import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.division,
    required super.title,
    required super.content,
    required super.subject,
    required super.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      division: json['division'],
      subject: json['subject'],
      status: json['status'].toString().toLowerCase(),
    );
  }
}
