import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/kanboard_ds_light_colors.dart';
import 'package:kan_board_web/app/core/design_system/radius/kanboard_ds_radius.dart';
import 'package:kan_board_web/app/core/design_system/typography/kanboard_ds_typography.dart';

ThemeData buildKanBoardDSLightTheme() {
  final colors = kanBoardDSLightColors;

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: colors.background,

    colorScheme: ColorScheme(
      brightness: Brightness.light,

      primary: colors.primary,
      onPrimary: Colors.white,

      secondary: colors.info,
      onSecondary: Colors.white,

      error: colors.error,
      onError: Colors.white,

      surface: colors.surface,
      onSurface: colors.textPrimary,
    ),

    textTheme: TextTheme(
      displayLarge: KanBoardDSTypography.displayLarge,
      displayMedium: KanBoardDSTypography.displayMedium,
      displaySmall: KanBoardDSTypography.displaySmall,

      headlineLarge: KanBoardDSTypography.headlineLarge,
      headlineMedium: KanBoardDSTypography.headlineMedium,
      headlineSmall: KanBoardDSTypography.headlineSmall,

      titleLarge: KanBoardDSTypography.titleLarge,
      titleMedium: KanBoardDSTypography.titleMedium,
      titleSmall: KanBoardDSTypography.titleSmall,

      bodyLarge: KanBoardDSTypography.bodyLarge,
      bodyMedium: KanBoardDSTypography.bodyMedium,
      bodySmall: KanBoardDSTypography.bodySmall,

      labelLarge: KanBoardDSTypography.labelLarge,
      labelMedium: KanBoardDSTypography.labelMedium,
      labelSmall: KanBoardDSTypography.labelSmall,
    ),

    dividerColor: colors.divider,

    cardTheme: CardThemeData(
      color: colors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(KanBoardDSRadius.large),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.surface,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(KanBoardDSRadius.medium),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(KanBoardDSRadius.medium),
        borderSide: BorderSide(color: colors.border),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(KanBoardDSRadius.medium),
        borderSide: BorderSide(
          color: colors.primary,
          width: 2,
        ),
      ),
    ),
  );
}
