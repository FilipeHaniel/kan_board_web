class Task {
  final String id;
  final String title;
  String status; // backlog, today, done

  Task({
    required this.id,
    required this.title,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      status: json['status'],
    );
  }
}
