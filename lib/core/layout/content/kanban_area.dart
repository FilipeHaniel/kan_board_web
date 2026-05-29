import 'package:flutter/material.dart';
import 'package:kan_board_web/core/layout/content/subject_section.dart';

class KanbanArea extends StatelessWidget {
  const KanbanArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SubjectSection(
            title: 'Matemática',
          ),
          SizedBox(height: 32),
          SubjectSection(
            title: 'História',
          ),
        ],
      ),
    );
  }
}
