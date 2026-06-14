import 'package:flutter/material.dart';

class StudyCard extends StatelessWidget {
  final String title;

  const StudyCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(
                Icons.timer_outlined,
                size: 16,
              ),
              SizedBox(width: 4),
              Text('45 min'),
            ],
          ),
        ],
      ),
    );
  }
}
