import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_planning_app/core/theme/app_colors.dart';

abstract final class AppTextStyles {
  static TextStyle display({
    double size = 32,
    FontWeight weight = FontWeight.w600,
    Color color = AppColors.ink,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.playfairDisplay(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle label({
    double size = 11,
    FontWeight weight = FontWeight.w600,
    Color color = AppColors.rose,
    double letterSpacing = 1.6,
  }) {
    return GoogleFonts.dmSans(
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }
}
