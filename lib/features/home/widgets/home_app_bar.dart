// lib/features/home/presentation/widgets/home_app_bar.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kandaq/core/theme/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Kandaq',
          style: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: HomepageColors.textPrimary,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Explore',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: HomepageColors.textPrimary,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Trending',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: HomepageColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}