class TaskEntity {
  final String id;
  final String title;
  final String content;
  final String division;
  final String subject;
  String status;

  TaskEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.division,
    required this.subject,
    required this.status,
  });
}
