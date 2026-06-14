import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/layout/topbar/topbar_info_chip.dart';
import 'package:kan_board_web/app/core/layout/topbar/topbar_user_menu.dart';

class AppTopbar extends StatelessWidget {
  const AppTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: const Row(
        children: [
          TopbarInfoChip(
            title: '🔥 Ritmo',
            value: '7 dias',
          ),
          SizedBox(width: 20),
          TopbarInfoChip(
            title: '⏱ Semana',
            value: '12h',
          ),
          SizedBox(width: 20),
          TopbarInfoChip(
            title: '🔁 Revisões',
            value: '3',
          ),
          Spacer(),
          TopbarUserMenu(),
        ],
      ),
    );
  }
}
