import 'package:flutter/material.dart';

@immutable
class KanBoardDSColorScheme {
  const KanBoardDSColorScheme({
    required this.primary,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,

    required this.background,
    required this.surface,
    required this.surfaceVariant,

    required this.border,
    required this.divider,

    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,

    required this.iconPrimary,
    required this.iconSecondary,
  });

  // Brand

  final Color primary;

  // Feedback

  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  // Surfaces

  final Color background;
  final Color surface;
  final Color surfaceVariant;

  // Borders

  final Color border;
  final Color divider;

  // Text

  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;

  // Icons

  final Color iconPrimary;
  final Color iconSecondary;
}
