import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

class GoalModel extends GoalEntity {
  const GoalModel({
    required super.id,
    required super.title,
    required super.examDate,
    required super.isActive,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      id: json['id'],
      title: json['title'],
      examDate: json['examDate'] != null
          ? DateTime.parse(json['examDate'])
          : null,
      isActive: json['isActive'],
    );
  }
}
