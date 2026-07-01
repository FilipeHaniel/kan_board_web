import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/colors/kanboard_ds_color_scheme.dart';
import 'package:kan_board_web/app/core/design_system/foundations/radius/kanboard_ds_radius.dart';
import 'package:kan_board_web/app/core/design_system/foundations/spacing/kanboard_ds_spacing.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_typography.dart';
import 'package:kan_board_web/app/core/design_system/primitives/text_field/kanboard_ds_text_field_size.dart';
import 'package:kan_board_web/app/core/design_system/primitives/text_field/kanboard_ds_text_field_style.dart';

abstract final class KanBoardDSTextFieldStyleResolver {
  KanBoardDSTextFieldStyleResolver._();

  static KanBoardDSTextFieldStyle resolve({
    required KanBoardDSColorScheme colors,
    required KanBoardDSTextFieldSize size,
    required bool enabled,
    required bool hovered,
    required bool focused,
    required bool hasError,
  }) {
    Color background = colors.surface;
    Color border = colors.border;

    if (!enabled) {
      background = colors.surfaceVariant;
      border = colors.border;
    } else if (hasError) {
      border = colors.error;
    } else if (focused) {
      border = colors.primary;
    } else if (hovered) {
      border = colors.textSecondary;
    }

    return KanBoardDSTextFieldStyle(
      backgroundColor: background,
      borderColor: border,

      textColor: enabled ? colors.textPrimary : colors.textDisabled,

      hintColor: colors.textSecondary,

      labelColor: hasError ? colors.error : colors.textPrimary,

      helperColor: colors.textSecondary,

      errorColor: colors.error,

      cursorColor: colors.primary,

      borderRadius: BorderRadius.circular(
        KanBoardDSRadius.medium,
      ),

      contentPadding: _padding(size),

      textStyle: KanBoardDSTypography.bodyMedium,

      labelStyle: KanBoardDSTypography.labelMedium,

      hintStyle: KanBoardDSTypography.bodyMedium.copyWith(
        color: colors.textSecondary,
      ),

      helperStyle: KanBoardDSTypography.bodySmall.copyWith(
        color: colors.textSecondary,
      ),

      errorStyle: KanBoardDSTypography.bodySmall.copyWith(
        color: colors.error,
      ),

      height: _height(size),
    );
  }

  static EdgeInsets _padding(
    KanBoardDSTextFieldSize size,
  ) {
    switch (size) {
      case KanBoardDSTextFieldSize.small:
        return const EdgeInsets.symmetric(
          horizontal: KanBoardDSSpacing.space12,
          vertical: KanBoardDSSpacing.space8,
        );

      case KanBoardDSTextFieldSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: KanBoardDSSpacing.space16,
          vertical: KanBoardDSSpacing.space12,
        );

      case KanBoardDSTextFieldSize.large:
        return const EdgeInsets.symmetric(
          horizontal: KanBoardDSSpacing.space20,
          vertical: KanBoardDSSpacing.space16,
        );
    }
  }

  static double _height(
    KanBoardDSTextFieldSize size,
  ) {
    switch (size) {
      case KanBoardDSTextFieldSize.small:
        return 40;

      case KanBoardDSTextFieldSize.medium:
        return 48;

      case KanBoardDSTextFieldSize.large:
        return 56;
    }
  }
}
