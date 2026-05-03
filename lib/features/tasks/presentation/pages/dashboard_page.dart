import 'package:flutter/material.dart';
import 'package:kan_board_web/features/tasks/domain/entities/task.dart';
import '../widgets/kanban_column.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Task> tasks = [
    Task(id: '1', title: 'Funções - Capítulo 1', status: 'backlog'),
    Task(id: '2', title: 'Geometria - Triângulos', status: 'today'),
    Task(id: '3', title: 'História - Idade Média', status: 'done'),
  ];

  void moveTask(Task task, String newStatus) {
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
