import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/layout/sidebar/app_sidebar.dart';
import 'package:kan_board_web/app/core/layout/topbar/app_topbar.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({
    super.key,
    required this.child,
  });

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
                  child: child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
