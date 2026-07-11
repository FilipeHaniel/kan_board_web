import 'package:kan_board_web/app/features/subjects/domain/entities/subject_entity.dart';

class SubjectModel extends SubjectEntity {
  const SubjectModel({
    required super.id,
    required super.name,
    required super.goalId,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      name: json['name'],
      goalId: json['goalId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'goalId': goalId,
    };
  }
}
