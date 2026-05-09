import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../widgets/bento_layout.dart';
import '../widgets/region_scroller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 72,
        title: const Text(
          'kandaq',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // 🔹 Hero Section
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main headline → headingLarge (Playfair Display)
                  Text('The daily log.', style: AppTypography.headingLarge),
                  const SizedBox(height: 12),
                  // Meta text → bodyMedium (secondary color)
                  Text(
                    'Updated today. 12 cities tracked. 840 entries.',
                    style: AppTypography.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Bento Grid
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            sliver: SliverToBoxAdapter(child: BentoLayout()),
          ),

          // 🔹 Regional Pulse
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 64),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section heading → headingMedium (Inter, 24px)
                  Text('Regional coverage', style: AppTypography.headingMedium),
                  const SizedBox(height: 16),
                  const RegionScroller(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}