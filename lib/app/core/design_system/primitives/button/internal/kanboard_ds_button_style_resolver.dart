import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/elevation/kanboard_ds_elevation.dart';
import 'package:kan_board_web/app/core/design_system/foundations/colors/kanboard_ds_color_scheme.dart';
import 'package:kan_board_web/app/core/design_system/foundations/radius/kanboard_ds_radius.dart';
import 'package:kan_board_web/app/core/design_system/foundations/spacing/kanboard_ds_spacing.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_typography.dart';
import 'package:kan_board_web/app/core/design_system/primitives/button/kanboard_ds_button_size.dart';
import 'package:kan_board_web/app/core/design_system/primitives/button/kanboard_ds_button_style.dart';
import 'package:kan_board_web/app/core/design_system/primitives/button/kanboard_ds_button_variant.dart';

abstract final class KanBoardDSButtonStyleResolver {
  KanBoardDSButtonStyleResolver._();

  static KanBoardDSButtonStyle resolve({
    required KanBoardDSColorScheme colors,
    required KanBoardDSButtonVariant variant,
    required KanBoardDSButtonSize size,
    required bool enabled,
    required bool hovered,
    required bool pressed,
  }) {
    switch (variant) {
      case KanBoardDSButtonVariant.primary:
        return _primary(
          colors: colors,
          size: size,
          enabled: enabled,
          hovered: hovered,
          pressed: pressed,
        );

      case KanBoardDSButtonVariant.secondary:
        return _secondary(
          colors: colors,
          size: size,
          enabled: enabled,
          hovered: hovered,
          pressed: pressed,
        );

      case KanBoardDSButtonVariant.outlined:
        return _outlined(
          colors: colors,
          size: size,
          enabled: enabled,
          hovered: hovered,
          pressed: pressed,
        );

      case KanBoardDSButtonVariant.ghost:
        return _ghost(
          colors: colors,
          size: size,
          enabled: enabled,
          hovered: hovered,
          pressed: pressed,
        );
    }
  }

  //--------------------------------------------------------------------------
  // Primary
  //--------------------------------------------------------------------------

  static KanBoardDSButtonStyle _primary({
    required KanBoardDSColorScheme colors,
    required KanBoardDSButtonSize size,
    required bool enabled,
    required bool hovered,
    required bool pressed,
  }) {
    Color background = colors.primary;

    if (!enabled) {
      background = colors.border;
    } else if (pressed) {
      background = _darken(colors.primary, .12);
    } else if (hovered) {
      background = _lighten(colors.primary, .04);
    }

    return KanBoardDSButtonStyle(
      backgroundColor: background,
      foregroundColor: enabled ? Colors.white : colors.textDisabled,
      borderColor: Colors.transparent,
      borderWidth: 0,
      borderRadius: BorderRadius.circular(
        KanBoardDSRadius.medium,
      ),
      padding: _padding(size),
      textStyle: _textStyle(size),
      boxShadows: enabled ? KanBoardDSElevation.small : const [],
      height: _height(size),
    );
  }

  //--------------------------------------------------------------------------
  // Secondary
  //--------------------------------------------------------------------------

  static KanBoardDSButtonStyle _secondary({
    required KanBoardDSColorScheme colors,
    required KanBoardDSButtonSize size,
    required bool enabled,
    required bool hovered,
    required bool pressed,
  }) {
    Color background = colors.surface;

    if (hovered) {
      background = colors.surfaceVariant;
    }

    if (pressed) {
      background = colors.background;
    }

    return KanBoardDSButtonStyle(
      backgroundColor: background,
      foregroundColor: enabled ? colors.textPrimary : colors.textDisabled,
      borderColor: colors.border,
      borderWidth: 1,
      borderRadius: BorderRadius.circular(
        KanBoardDSRadius.medium,
      ),
      padding: _padding(size),
      textStyle: _textStyle(size),
      boxShadows: const [],
      height: _height(size),
    );
  }

  //--------------------------------------------------------------------------
  // Outlined
  //--------------------------------------------------------------------------

  static KanBoardDSButtonStyle _outlined({
    required KanBoardDSColorScheme colors,
    required KanBoardDSButtonSize size,
    required bool enabled,
    required bool hovered,
    required bool pressed,
  }) {
    Color background = Colors.transparent;

    if (hovered) {
      background = colors.surfaceVariant;
    }

    if (pressed) {
      background = colors.background;
    }

    return KanBoardDSButtonStyle(
      backgroundColor: background,
      foregroundColor: enabled ? colors.primary : colors.textDisabled,
      borderColor: enabled ? colors.primary : colors.border,
      borderWidth: 1,
      borderRadius: BorderRadius.circular(
        KanBoardDSRadius.medium,
      ),
      padding: _padding(size),
      textStyle: _textStyle(size),
      boxShadows: const [],
      height: _height(size),
    );
  }

  //--------------------------------------------------------------------------
  // Ghost
  //--------------------------------------------------------------------------

  static KanBoardDSButtonStyle _ghost({
    required KanBoardDSColorScheme colors,
    required KanBoardDSButtonSize size,
    required bool enabled,
    required bool hovered,
    required bool pressed,
  }) {
    Color background = Colors.transparent;

    if (hovered) {
      background = colors.surfaceVariant;
    }

    if (pressed) {
      background = colors.background;
    }

    return KanBoardDSButtonStyle(
      backgroundColor: background,
      foregroundColor: enabled ? colors.textPrimary : colors.textDisabled,
      borderColor: Colors.transparent,
      borderWidth: 0,
      borderRadius: BorderRadius.circular(
        KanBoardDSRadius.medium,
      ),
      padding: _padding(size),
      textStyle: _textStyle(size),
      boxShadows: const [],
      height: _height(size),
    );
  }

  //--------------------------------------------------------------------------
  // Helpers
  //--------------------------------------------------------------------------

  static EdgeInsets _padding(
    KanBoardDSButtonSize size,
  ) {
    switch (size) {
      case KanBoardDSButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: KanBoardDSSpacing.space12,
          vertical: KanBoardDSSpacing.space8,
        );

      case KanBoardDSButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: KanBoardDSSpacing.space16,
          vertical: KanBoardDSSpacing.space12,
        );

      case KanBoardDSButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: KanBoardDSSpacing.space24,
          vertical: KanBoardDSSpacing.space16,
        );
    }
  }

  static double _height(
    KanBoardDSButtonSize size,
  ) {
    switch (size) {
      case KanBoardDSButtonSize.small:
        return 36;

      case KanBoardDSButtonSize.medium:
        return 44;

      case KanBoardDSButtonSize.large:
        return 52;
    }
  }

  static TextStyle _textStyle(
    KanBoardDSButtonSize size,
  ) {
    switch (size) {
      case KanBoardDSButtonSize.small:
        return KanBoardDSTypography.labelMedium;

      case KanBoardDSButtonSize.medium:
        return KanBoardDSTypography.labelLarge;

      case KanBoardDSButtonSize.large:
        return KanBoardDSTypography.titleSmall;
    }
  }

  static Color _lighten(Color color, double amount) {
    return Color.lerp(color, Colors.white, amount)!;
  }

  static Color _darken(Color color, double amount) {
    return Color.lerp(color, Colors.black, amount)!;
  }
}
