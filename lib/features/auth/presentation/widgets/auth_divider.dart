// features/auth/presentation/widgets/auth_divider.dart
import 'package:flutter/material.dart';
import 'package:kandaq/core/theme/app_colors.dart';
import 'package:kandaq/core/theme/app_typography.dart';

class AuthDivider extends StatelessWidget {
  final String text;
  const AuthDivider({super.key, this.text = 'or'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          Expanded(
            child: CustomPaint(
              size: const Size(double.infinity, 1),
              painter: _BatikPatternPainter(), // Subtle dashed pattern
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(text, style: AppTypography.bodyMedium),
          ),
          Expanded(
            child: CustomPaint(
              size: const Size(double.infinity, 1),
              painter: _BatikPatternPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BatikPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    
    // Dashed line: 4px dash, 4px gap (batik-inspired rhythm)
    final path = Path();
    for (double i = 0; i < size.width; i += 8) {
      path.moveTo(i, 0.5);
      path.lineTo(i + 4, 0.5);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}