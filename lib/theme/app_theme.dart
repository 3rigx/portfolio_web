import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typo.dart';

class AppTheme {
  static const double borderRadius = 16.0;

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: AppTypography.textTheme,
    primaryTextTheme: AppTypography.textTheme,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.primaryDark,
      surface: AppColors.surface,
      onSurface: AppColors.text,
    ),
    cardTheme: CardTheme(
      color: AppColors.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: const BorderSide(
          color: Color(0xFF1A1A1A), // Very subtle border
          width: 1.0,
        ),
      ),
      margin: EdgeInsets.zero,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
        elevation: 4,
        shadowColor: AppColors.primary.withAlpha(
          (255 * 0.5).toInt(),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    ),
  );

  static BoxDecoration glowingContainer = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: [
      BoxShadow(
        color: AppColors.primary.withAlpha(
          (255 * 0.15).toInt(),
        ),
        blurRadius: 12,
        spreadRadius: 2,
      ),
    ],
  );

  static BoxDecoration primaryGlowingBorder = BoxDecoration(
    border: Border.all(color: AppColors.primary),
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: [
      BoxShadow(
        color: AppColors.primary.withAlpha(
          (255 * 0.2).toInt(),
        ),
        blurRadius: 8,
        spreadRadius: 1,
      ),
    ],
  );
}
