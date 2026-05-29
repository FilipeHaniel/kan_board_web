import 'package:flutter/material.dart';

class KanbanArea extends StatelessWidget {
  const KanbanArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          'KANBAN AREA',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
