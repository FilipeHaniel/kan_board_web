import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'kanboard_ds_font_weights.dart';

/// Typography definitions for the KanBoard Design System.
///
/// All text styles should be consumed from this class.
///
/// Never create TextStyles inline inside widgets.
abstract final class KanBoardDSTypography {
  KanBoardDSTypography._();

  static final String fontFamily = GoogleFonts.inter().fontFamily!;

  //--------------------------------------------------------------------------
  // Display
  //--------------------------------------------------------------------------

  static final TextStyle displayLarge = GoogleFonts.inter(
    fontSize: 48,
    fontWeight: KanBoardDSFontWeights.bold,
    height: 1.20,
    letterSpacing: -0.5,
  );

  static final TextStyle displayMedium = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: KanBoardDSFontWeights.bold,
    height: 1.20,
    letterSpacing: -0.5,
  );

  static final TextStyle displaySmall = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: KanBoardDSFontWeights.bold,
    height: 1.20,
    letterSpacing: -0.25,
  );

  //--------------------------------------------------------------------------
  // Headline
  //--------------------------------------------------------------------------

  static final TextStyle headlineLarge = GoogleFonts.inter(
    fontSize: 30,
    fontWeight: KanBoardDSFontWeights.semiBold,
    height: 1.25,
  );

  static final TextStyle headlineMedium = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: KanBoardDSFontWeights.semiBold,
    height: 1.25,
  );

  static final TextStyle headlineSmall = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: KanBoardDSFontWeights.semiBold,
    height: 1.30,
  );

  //--------------------------------------------------------------------------
  // Title
  //--------------------------------------------------------------------------

  static final TextStyle titleLarge = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: KanBoardDSFontWeights.semiBold,
    height: 1.35,
  );

  static final TextStyle titleMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: KanBoardDSFontWeights.medium,
    height: 1.40,
  );

  static final TextStyle titleSmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: KanBoardDSFontWeights.medium,
    height: 1.40,
  );

  //--------------------------------------------------------------------------
  // Body
  //--------------------------------------------------------------------------

  static final TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: KanBoardDSFontWeights.regular,
    height: 1.50,
  );

  static final TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: KanBoardDSFontWeights.regular,
    height: 1.50,
  );

  static final TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: KanBoardDSFontWeights.regular,
    height: 1.50,
  );

  //--------------------------------------------------------------------------
  // Label
  //--------------------------------------------------------------------------

  static final TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: KanBoardDSFontWeights.medium,
    height: 1.30,
  );

  static final TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: KanBoardDSFontWeights.medium,
    height: 1.30,
  );

  static final TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: KanBoardDSFontWeights.medium,
    height: 1.30,
  );
}
