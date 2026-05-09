// lib/features/home/presentation/widgets/home_hero_section.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kandaq/core/theme/app_colors.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return isMobile
        ? const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroText(),
              SizedBox(height: 48),
              _HeroImage(),
            ],
          )
        : const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: _HeroText(),
              ),
              SizedBox(width: 48),
              Expanded(
                flex: 5,
                child: _HeroImage(),
              ),
            ],
          );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Every Malaysian\nhas a nasi kandar\nspot they swear by.',
          style: GoogleFonts.playfairDisplay(
            fontSize: 64,
            fontWeight: FontWeight.w700,
            height: 1.05,
            color: HomepageColors.textPrimary,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 460,
          child: Text(
            'A quiet archive of late nights, heavy plates, and places people keep returning to.',
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.7,
              color: HomepageColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 40),

        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: HomepageColors.border,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Search nasi kandar spots',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: HomepageColors.textTertiary,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_outward,
                size: 18,
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                side: const BorderSide(
                  color: HomepageColors.border,
                ),
              ),
              child: const Text('Explore'),
            ),
            const SizedBox(width: 12),
            TextButton(
              onPressed: () {},
              child: const Text('Random spot'),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroImage extends StatelessWidget {
  const _HeroImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 620,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
              fit: BoxFit.cover,
              // ✅ Updated to use withValues()
              color: Colors.black.withValues(alpha: 0.35),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Positioned(
            left: 24,
            bottom: 24,
            child: Text(
              'Kuala Lumpur\n2:14 AM',
              style: GoogleFonts.inter(
                fontSize: 13,
                color: Colors.white70,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}