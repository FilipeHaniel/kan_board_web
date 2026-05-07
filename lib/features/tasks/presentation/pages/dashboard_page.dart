import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    final result = await api.getTasks();

    setState(() {
      tasks = result;
    });
  }

  Future<void> moveTask(Task task, String newStatus) async {
    await api.moveTask(task.id, newStatus);

    setState(() {
      task.status = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Row(
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
    );
  }
}
