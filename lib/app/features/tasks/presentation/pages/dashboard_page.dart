import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/layout/app_layout.dart';
import 'package:kan_board_web/app/core/layout/content/kanban_area.dart';
import 'package:kan_board_web/app/features/review/data/datasourses/review_datasource.dart';
import 'package:kan_board_web/app/features/study/data/datasources/streak_datasource.dart';
import 'package:kan_board_web/app/features/tasks/data/tasks_datasource.dart';
import 'package:kan_board_web/app/features/tasks/domain/entities/task.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final api = TasksDatasource();
  List<Task> tasks = [];

  final streakApi = StreakDatasource();
  int streak = 0;

  final reviewApi = ReviewDatasource();
  List<dynamic> reviews = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
    loadStreak();
    loadReviews();
  }

  Future<void> loadTasks() async {
    final result = await api.getTasks();

    setState(() {
      tasks = result;
    });
  }

  Future<void> loadStreak() async {
    final result = await streakApi.getStreak();

    setState(() {
      streak = result;
    });
  }

  Future<void> moveTask(Task task, String newStatus) async {
    await api.moveTask(task.id, newStatus);

    setState(() {
      task.status = newStatus;
    });
  }

  Future<void> loadReviews() async {
    final result = await reviewApi.getPendingReviews();

    setState(() {
      reviews = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: KanbanArea(
        tasks: tasks,
        onTaskDropped: moveTask,
      ),
    );
  }
}
