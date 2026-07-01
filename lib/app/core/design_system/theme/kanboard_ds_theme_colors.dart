import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/colors/kanboard_ds_color_scheme.dart';

@immutable
class KanBoardDSThemeColors extends ThemeExtension<KanBoardDSThemeColors> {
  final KanBoardDSColorScheme colors;

  const KanBoardDSThemeColors({
    required this.colors,
  });

  @override
  KanBoardDSThemeColors copyWith({
    KanBoardDSColorScheme? colors,
  }) {
    return KanBoardDSThemeColors(
      colors: colors ?? this.colors,
    );
  }

  @override
  KanBoardDSThemeColors lerp(
    ThemeExtension<KanBoardDSThemeColors>? other,
    double t,
  ) {
    return this;
  }
}
