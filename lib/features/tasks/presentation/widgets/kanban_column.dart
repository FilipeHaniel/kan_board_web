import 'package:flutter/material.dart';

class KanbanColumn extends StatelessWidget {
  final String title;

  const KanbanColumn({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Container(
              height: 80,
              margin: const EdgeInsets.symmetric(vertical: 4),
              color: Colors.white,
              child: const Center(child: Text('Card exemplo')),
            ),
          ],
        ),
      ),
    );
  }
}
