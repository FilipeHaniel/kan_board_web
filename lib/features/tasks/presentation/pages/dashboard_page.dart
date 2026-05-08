import 'package:flutter/material.dart';
import 'package:kan_board_web/features/review/data/datasourses/review_datasource.dart';
import 'package:kan_board_web/features/study/data/datasources/streak_datasource.dart';
import 'package:kan_board_web/features/tasks/data/tasks_datasource.dart';
import 'package:kan_board_web/features/tasks/domain/entities/task.dart';
import 'package:kan_board_web/features/tasks/presentation/widgets/kanban_column.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '🔥 Ritmo de Estudo: $streak dias',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('🔁 Revisões pendentes: ${reviews.length}'),
          ),
          Expanded(
            child: Row(
              children: [
                KanbanColumn(
                  title: 'Backlog',
                  status: 'backlog',
                  tasks: tasks.where((t) => t.status == 'backlog').toList(),
                  onTaskDropped: moveTask,
                ),
                KanbanColumn(
                  title: 'Hoje',
                  status: 'today',
                  tasks: tasks.where((t) => t.status == 'today').toList(),
                  onTaskDropped: moveTask,
                ),
                KanbanColumn(
                  title: 'Concluído',
                  status: 'done',
                  tasks: tasks.where((t) => t.status == 'done').toList(),
                  onTaskDropped: moveTask,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
