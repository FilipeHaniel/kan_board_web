class Task {
  final String id;
  final String title;

  String status;

  final String subject;
  final String division;

  Task({
    required this.id,
    required this.title,
    required this.status,
    required this.subject,
    required this.division,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      status: json['status'],
      subject: json['subject'] ?? '',
      division: json['division'] ?? '',
    );
  }
}
