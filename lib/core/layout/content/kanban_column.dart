import 'package:flutter/material.dart';
import 'package:kan_board_web/core/layout/content/study_card.dart';

class KanbanColumn extends StatelessWidget {
  final String title;

  const KanbanColumn({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const StudyCard(
            title: 'Função',
          ),
          SizedBox(height: 12),
          const StudyCard(
            title: 'Equação',
          ),
        ],
      ),
    );
  }
}
