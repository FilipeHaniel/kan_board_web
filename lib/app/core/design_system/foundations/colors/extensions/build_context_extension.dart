import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/colors/kanboard_ds_color_scheme.dart';
import 'package:kan_board_web/app/core/design_system/theme/kanboard_ds_theme_colors.dart';

extension KanBoardDSBuildContextExtension on BuildContext {
  KanBoardDSThemeColors get dsTheme =>
      Theme.of(this).extension<KanBoardDSThemeColors>()!;

  KanBoardDSColorScheme get dsColors => dsTheme.colors;
}
