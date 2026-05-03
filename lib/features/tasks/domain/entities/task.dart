class Task {
  final String id;
  final String title;
  String status; // backlog, today, done

  Task({
    required this.id,
    required this.title,
    required this.status,
  });
}
