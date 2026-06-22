class GoalEntity {
  final String id;
  final String title;
  final DateTime? examDate;
  final bool isActive;

  const GoalEntity({
    required this.id,
    required this.title,
    required this.examDate,
    required this.isActive,
  });
}
