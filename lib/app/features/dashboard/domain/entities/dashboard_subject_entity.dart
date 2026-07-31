class DashboardSubjectEntity {
  final String id;
  final String name;
  final List<DashboardDivisionEntity> divisions;

  const DashboardSubjectEntity({
    required this.id,
    required this.name,
    required this.divisions,
  });

  DashboardSubjectEntity copyWith({
    String? id,
    String? name,
    List<DashboardDivisionEntity>? divisions,
  }) {
    return DashboardSubjectEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      divisions: divisions ?? this.divisions,
    );
  }
}

class DashboardDivisionEntity {
  final String id;
  final String name;
  final List<DashboardContentEntity> contents;

  const DashboardDivisionEntity({
    required this.id,
    required this.name,
    required this.contents,
  });

  DashboardDivisionEntity copyWith({
    String? id,
    String? name,
    List<DashboardContentEntity>? contents,
  }) {
    return DashboardDivisionEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      contents: contents ?? this.contents,
    );
  }
}

class DashboardContentEntity {
  final String id;
  final String title;
  final String status;
  final int position;
  final List<DashboardTaskEntity> tasks;

  const DashboardContentEntity({
    required this.id,
    required this.title,
    required this.status,
    required this.position,
    required this.tasks,
  });

  DashboardContentEntity copyWith({
    String? id,
    String? title,
    String? status,
    int? position,
    List<DashboardTaskEntity>? tasks,
  }) {
    return DashboardContentEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      position: position ?? this.position,
      tasks: tasks ?? this.tasks,
    );
  }
}

class DashboardTaskEntity {
  final String id;
  final String title;
  final String status;
  final int position;
  final int? estimatedMinutes;

  const DashboardTaskEntity({
    required this.id,
    required this.title,
    required this.status,
    required this.position,
    this.estimatedMinutes,
  });

  DashboardTaskEntity copyWith({
    String? id,
    String? title,
    String? status,
    int? position,
    int? estimatedMinutes,
  }) {
    return DashboardTaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      position: position ?? this.position,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
    );
  }
}
