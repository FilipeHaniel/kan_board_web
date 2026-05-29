import 'package:flutter/material.dart';
import 'package:kan_board_web/core/layout/content/kanban_area.dart';
import 'package:kan_board_web/core/layout/sidebar/app_sidebar.dart';
import 'package:kan_board_web/core/layout/topbar/app_topbar.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AppSidebar(),
          Expanded(
            child: Column(
              children: [
                const AppTopbar(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: const KanbanArea(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
