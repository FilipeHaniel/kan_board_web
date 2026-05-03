import 'package:flutter/material.dart';
import 'package:kan_board_web/features/tasks/presentation/widgets/kanban_column.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Row(
        children: const [
          KanbanColumn(title: 'Backlog'),
          KanbanColumn(title: 'Hoje'),
          KanbanColumn(title: 'Concluído'),
        ],
      ),
    );
  }
}
