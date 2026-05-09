import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_colors.dart';

class HomeTypography {
  HomeTypography._();

  // Display - Editorial Serif (for headlines, section titles)
  static TextStyle displayLarge = GoogleFonts.playfairDisplay(
    fontSize: 96,
    fontWeight: FontWeight.w700,
    color: HomeColors.pureBlack,
    height: 1.0,
    letterSpacing: -2.0,
  );

  static TextStyle displayMedium = GoogleFonts.playfairDisplay(
    fontSize: 64,
    fontWeight: FontWeight.w700,
    color: HomeColors.pureBlack,
    height: 1.05,
    letterSpacing: -1.5,
  );

  static TextStyle displaySmall = GoogleFonts.playfairDisplay(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: HomeColors.pureBlack,
    height: 1.1,
    letterSpacing: -0.5,
  );

  // Headline - For card titles, section labels
  static TextStyle headlineLarge = GoogleFonts.playfairDisplay(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: HomeColors.pureBlack,
    height: 1.15,
  );

  static TextStyle headlineMedium = GoogleFonts.playfairDisplay(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: HomeColors.pureBlack,
    height: 1.2,
  );

  static TextStyle headlineSmall = GoogleFonts.playfairDisplay(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: HomeColors.pureBlack,
    height: 1.25,
  );

  // Body - Geometric Sans for UI, descriptions
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: HomeColors.grey700,
    height: 1.5,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: HomeColors.grey600,
    height: 1.5,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: HomeColors.grey500,
    height: 1.4,
  );

  // Label
  static TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: HomeColors.pureBlack,
    letterSpacing: 1.5,
    height: 1.3,
  );

  static TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: HomeColors.grey500,
    letterSpacing: 2.0,
    height: 1.3,
  );

  // Accent - Pull quotes, special text
  static TextStyle quoteLarge = GoogleFonts.playfairDisplay(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: HomeColors.grey600,
    height: 1.4,
  );

  // Stat numbers
  static TextStyle statNumber = GoogleFonts.inter(
    fontSize: 56,
    fontWeight: FontWeight.w700,
    color: HomeColors.pureBlack,
    height: 1.0,
    letterSpacing: -1.0,
  );

  static TextStyle statNumberSmall = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: HomeColors.pureBlack,
    height: 1.0,
    letterSpacing: -0.5,
  );
}