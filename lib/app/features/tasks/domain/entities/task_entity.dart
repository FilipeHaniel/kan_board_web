class TaskEntity {
  final String id;
  final String title;
  final String content;
  final String division;
  final String subject;
  final String status;

  TaskEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.division,
    required this.subject,
    required this.status,
  });

  TaskEntity copyWith({
    String? id,
    String? title,
    String? content,
    String? status,
    String? subject,
    String? division,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      status: status ?? this.status,
      subject: subject ?? this.subject,
      division: division ?? this.division,
    );
  }
}
