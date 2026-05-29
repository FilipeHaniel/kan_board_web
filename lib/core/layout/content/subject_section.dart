import 'package:flutter/material.dart';

import 'division_section.dart';

class SubjectSection extends StatelessWidget {
  final String title;

  const SubjectSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📚 $title',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        const DivisionSection(
          title: 'Frente A',
        ),
        const SizedBox(height: 24),
        const DivisionSection(
          title: 'Frente B',
        ),
      ],
    );
  }
}
