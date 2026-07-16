import 'package:kan_board_web/app/features/tasks/domain/entities/task_entity.dart';

class ContentEntity {
  final String id;
  final String title;
  final String status;
  final int position;
  final String divisionId;
  final List<TaskEntity> tasks;

  const ContentEntity({
    required this.id,
    required this.title,
    required this.status,
    required this.position,
    required this.divisionId,
    required this.tasks,
  });
}
