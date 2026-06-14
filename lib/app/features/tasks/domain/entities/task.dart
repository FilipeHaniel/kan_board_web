class Task {
  final String id;
  final String title;
  final String content;
  final String division;
  final String subject;
  String status;

  Task({
    required this.id,
    required this.title,
    required this.content,
    required this.division,
    required this.subject,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      division: json['division'],
      subject: json['subject'],
      status: json['status'].toString().toLowerCase(),
    );
  }
}
