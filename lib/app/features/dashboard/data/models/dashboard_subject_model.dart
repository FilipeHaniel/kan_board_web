import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';

class DashboardSubjectModel extends DashboardSubjectEntity {
  const DashboardSubjectModel({
    required super.id,
    required super.name,
    required super.contents,
  });

  factory DashboardSubjectModel.fromJson(Map<String, dynamic> json) {
    return DashboardSubjectModel(
      id: json['id'] as String,
      name: json['name'] as String,
      contents: (json['contents'] as List<dynamic>? ?? [])
          .map(
            (e) => DashboardContentModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}

class DashboardContentModel extends DashboardContentEntity {
  const DashboardContentModel({
    required super.id,
    required super.title,
    required super.status,
    required super.position,
    required super.tasks,
  });

  factory DashboardContentModel.fromJson(Map<String, dynamic> json) {
    return DashboardContentModel(
      id: json['id'] as String,
      title: json['title'] as String,
      status: json['status'] as String,
      position: json['position'] as int? ?? 0,
      tasks: (json['tasks'] as List<dynamic>? ?? [])
          .map(
            (e) => DashboardTaskModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}

class DashboardTaskModel extends DashboardTaskEntity {
  const DashboardTaskModel({
    required super.id,
    required super.title,
    required super.status,
    required super.position,
    super.estimatedMinutes,
  });

  factory DashboardTaskModel.fromJson(Map<String, dynamic> json) {
    return DashboardTaskModel(
      id: json['id'] as String,
      title: json['title'] as String,
      status: json['status'] as String,
      position: json['position'] as int? ?? 0,
      estimatedMinutes: json['estimatedMinutes'] as int?,
    );
  }
}
