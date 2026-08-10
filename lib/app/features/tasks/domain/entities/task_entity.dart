class TaskEntity {
  final String id;
  final String title;
  final String? content;
  final String? division;
  final String? subject;
  final String status;
  final int position;
  final int? estimatedMinutes;
  final String contentId;

  TaskEntity({
    required this.id,
    required this.title,
    this.content,
    this.division,
    this.subject,
    required this.status,
    required this.position,
    this.estimatedMinutes,
    required this.contentId,
  });

  TaskEntity copyWith({
    String? id,
    String? title,
    String? content,
    String? status,
    String? subject,
    String? division,
    int? position,
    int? estimatedMinutes,
    String? contentId,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      status: status ?? this.status,
      subject: subject ?? this.subject,
      division: division ?? this.division,
      position: position ?? this.position,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      contentId: contentId ?? this.contentId,
    );
  }
}
