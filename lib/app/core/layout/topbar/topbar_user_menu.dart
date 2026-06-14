import 'package:flutter/material.dart';

class TopbarUserMenu extends StatelessWidget {
  const TopbarUserMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey.shade300,
      child: const Icon(
        Icons.person_outline,
      ),
    );
  }
}
