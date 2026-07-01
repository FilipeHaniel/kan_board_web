import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/theme/kanboard_ds_dark_theme.dart';
import 'package:kan_board_web/app/core/design_system/theme/kanboard_ds_light_theme.dart';

abstract final class KanBoardDSTheme {
  KanBoardDSTheme._();

  static ThemeData get light => buildKanBoardDSLightTheme();

  static ThemeData get dark => buildKanBoardDSDarkTheme();
}
