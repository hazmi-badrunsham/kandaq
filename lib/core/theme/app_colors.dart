// lib/core/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF000000); // Pure black
  
  // Backgrounds
  static const Color background = Color(0xFFFFFFFF); // Pure white
  static const Color surface = Color(0xFFF8F8F8); // Subtle off-white for cards
  
  // Text
  static const Color textPrimary = Color(0xFF000000); // Headings, labels
  static const Color textSecondary = Color(0xFF666666); // Helper text, placeholders
  static const Color textDisabled = Color(0xFF999999); // Disabled states
  
  // Borders & Dividers
  static const Color border = Color(0xFFE0E0E0); // Input borders, dividers
  static const Color borderFocus = Color(0xFF000000); // Focused input border
  
  // Error
  static const Color error = Color(0xFFCC0000); // Minimal red for errors only
  
  // Batik-inspired subtle pattern (monochrome)
  // Use as decorative divider: 1px dashed line with 4px gap
}