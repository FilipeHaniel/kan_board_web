import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';

class DashboardSubjectModel extends DashboardSubjectEntity {
  const DashboardSubjectModel({
    required super.id,
    required super.name,
    required super.divisions,
  });

  factory DashboardSubjectModel.fromJson(Map<String, dynamic> json) {
    return DashboardSubjectModel(
      id: json['id'],
      name: json['name'],
      divisions: (json['divisions'] as List)
          .map(
            (e) => DashboardDivisionModel.fromJson(e),
          )
          .toList(),
    );
  }
}

class DashboardDivisionModel extends DashboardDivisionEntity {
  const DashboardDivisionModel({
    required super.id,
    required super.name,
    required super.contents,
  });

  factory DashboardDivisionModel.fromJson(Map<String, dynamic> json) {
    return DashboardDivisionModel(
      id: json['id'],
      name: json['name'],
      contents: (json['contents'] as List)
          .map(
            (e) => DashboardContentModel.fromJson(e),
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
      id: json['id'],
      title: json['title'],
      status: json['status'],
      position: json['position'],
      tasks: (json['tasks'] as List)
          .map(
            (e) => DashboardTaskModel.fromJson(e),
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
      id: json['id'],
      title: json['title'],
      status: json['status'],
      position: json['position'],
      estimatedMinutes: json['estimatedMinutes'],
    );
  }
}
