import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/layout/sidebar/sidebar_logo.dart';
import 'package:kan_board_web/app/core/layout/sidebar/sidebar_navigation_item.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        border: Border(
          right: BorderSide(
            color: Colors.grey.shade800,
          ),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SidebarLogo(),
          SizedBox(height: 40),
          SidebarNavigationItem(
            icon: Icons.dashboard_outlined,
            label: 'Dashboard',
          ),
          SidebarNavigationItem(
            icon: Icons.menu_book_outlined,
            label: 'Estudos',
          ),
          SidebarNavigationItem(
            icon: Icons.today_outlined,
            label: 'Hoje',
          ),
          SidebarNavigationItem(
            icon: Icons.refresh_outlined,
            label: 'Revisões',
          ),
          SidebarNavigationItem(
            icon: Icons.bar_chart_outlined,
            label: 'Progresso',
          ),
          SidebarNavigationItem(
            icon: Icons.settings_outlined,
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
