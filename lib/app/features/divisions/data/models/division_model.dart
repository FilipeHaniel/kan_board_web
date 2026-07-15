import 'package:kan_board_web/app/features/divisions/domain/entities/division_entity.dart';

class DivisionModel extends DivisionEntity {
  const DivisionModel({
    required super.id,
    required super.name,
    required super.subjectId,
  });

  factory DivisionModel.fromJson(Map<String, dynamic> json) {
    return DivisionModel(
      id: json['id'],
      name: json['name'],
      subjectId: json['subjectId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subjectId': subjectId,
    };
  }
}
