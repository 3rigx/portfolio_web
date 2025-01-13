import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTypography {
  static final fontFamily = GoogleFonts.spaceGrotesk();
  static final headingFamily = GoogleFonts.orbitron();

  static TextTheme textTheme = TextTheme(
    headlineLarge: headingFamily.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
    ),
    headlineMedium: headingFamily.copyWith(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
    ),
    bodyLarge: fontFamily.copyWith(
      fontSize: 16,
      color: AppColors.text,
    ),
    bodyMedium: fontFamily.copyWith(
      fontSize: 14,
      color: AppColors.text,
    ),
    labelLarge: fontFamily.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
    labelSmall: fontFamily.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
  );
}
