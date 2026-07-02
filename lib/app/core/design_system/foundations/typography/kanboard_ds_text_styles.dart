import 'package:flutter/material.dart';

import 'package:kan_board_web/app/core/design_system/foundations/colors/extensions/build_context_extension.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_typography.dart';

abstract final class KanBoardDSTextStyles {
  KanBoardDSTextStyles._();

  //--------------------------------------------------------------------------
  // Display
  //--------------------------------------------------------------------------

  static TextStyle displayLarge(BuildContext context) {
    return KanBoardDSTypography.displayLarge.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  static TextStyle displayMedium(BuildContext context) {
    return KanBoardDSTypography.displayMedium.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  static TextStyle displaySmall(BuildContext context) {
    return KanBoardDSTypography.displaySmall.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  //--------------------------------------------------------------------------
  // Headline
  //--------------------------------------------------------------------------

  static TextStyle headlineLarge(BuildContext context) {
    return KanBoardDSTypography.headlineLarge.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  static TextStyle headlineMedium(BuildContext context) {
    return KanBoardDSTypography.headlineMedium.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  static TextStyle headlineSmall(BuildContext context) {
    return KanBoardDSTypography.headlineSmall.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  //--------------------------------------------------------------------------
  // Title
  //--------------------------------------------------------------------------

  static TextStyle titleLarge(BuildContext context) {
    return KanBoardDSTypography.titleLarge.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  static TextStyle titleMedium(BuildContext context) {
    return KanBoardDSTypography.titleMedium.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  static TextStyle titleSmall(BuildContext context) {
    return KanBoardDSTypography.titleSmall.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  //--------------------------------------------------------------------------
  // Body
  //--------------------------------------------------------------------------

  static TextStyle bodyLarge(BuildContext context) {
    return KanBoardDSTypography.bodyLarge.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return KanBoardDSTypography.bodyMedium.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    return KanBoardDSTypography.bodySmall.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  //--------------------------------------------------------------------------
  // Body Secondary
  //--------------------------------------------------------------------------

  static TextStyle bodyLargeSecondary(BuildContext context) {
    return KanBoardDSTypography.bodyLarge.copyWith(
      color: context.dsColors.textSecondary,
    );
  }

  static TextStyle bodyMediumSecondary(BuildContext context) {
    return KanBoardDSTypography.bodyMedium.copyWith(
      color: context.dsColors.textSecondary,
    );
  }

  static TextStyle bodySmallSecondary(BuildContext context) {
    return KanBoardDSTypography.bodySmall.copyWith(
      color: context.dsColors.textSecondary,
    );
  }

  //--------------------------------------------------------------------------
  // Label
  //--------------------------------------------------------------------------

  static TextStyle labelLarge(BuildContext context) {
    return KanBoardDSTypography.labelLarge.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  static TextStyle labelMedium(BuildContext context) {
    return KanBoardDSTypography.labelMedium.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  static TextStyle labelSmall(BuildContext context) {
    return KanBoardDSTypography.labelSmall.copyWith(
      color: context.dsColors.textPrimary,
    );
  }

  //--------------------------------------------------------------------------
  // Label Secondary
  //--------------------------------------------------------------------------

  static TextStyle labelLargeSecondary(BuildContext context) {
    return KanBoardDSTypography.labelLarge.copyWith(
      color: context.dsColors.textSecondary,
    );
  }

  static TextStyle labelMediumSecondary(BuildContext context) {
    return KanBoardDSTypography.labelMedium.copyWith(
      color: context.dsColors.textSecondary,
    );
  }

  static TextStyle labelSmallSecondary(BuildContext context) {
    return KanBoardDSTypography.labelSmall.copyWith(
      color: context.dsColors.textSecondary,
    );
  }

  //--------------------------------------------------------------------------
  // Feedback
  //--------------------------------------------------------------------------

  static TextStyle error(BuildContext context) {
    return KanBoardDSTypography.bodySmall.copyWith(
      color: context.dsColors.error,
    );
  }

  static TextStyle success(BuildContext context) {
    return KanBoardDSTypography.bodySmall.copyWith(
      color: context.dsColors.success,
    );
  }

  static TextStyle warning(BuildContext context) {
    return KanBoardDSTypography.bodySmall.copyWith(
      color: context.dsColors.warning,
    );
  }

  static TextStyle info(BuildContext context) {
    return KanBoardDSTypography.bodySmall.copyWith(
      color: context.dsColors.info,
    );
  }

  //--------------------------------------------------------------------------
  // Disabled
  //--------------------------------------------------------------------------

  static TextStyle disabled(BuildContext context) {
    return KanBoardDSTypography.bodyMedium.copyWith(
      color: context.dsColors.textDisabled,
    );
  }
}
