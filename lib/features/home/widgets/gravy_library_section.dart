import 'package:flutter/material.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';
import '../data/home_data.dart';

class GravyLibrarySection extends StatelessWidget {
  const GravyLibrarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LIBRARY OF GRAVY',
                  style: HomeTypography.labelMedium.copyWith(
                    letterSpacing: 4.0,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Study the\nfoundations.',
                  style: HomeTypography.displayMedium.copyWith(
                    height: 1.05,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),

          // Horizontal scroll
          SizedBox(
            height: 400,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              scrollDirection: Axis.horizontal,
              itemCount: HomeData.gravyLibrary.length,
              separatorBuilder: (_, __) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                final gravy = HomeData.gravyLibrary[index];
                return _GravyCard(gravy: gravy);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _GravyCard extends StatelessWidget {
  final GravyData gravy;

  const _GravyCard({required this.gravy});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: HomeColors.grey50,
        border: Border.all(color: HomeColors.grey100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Specimen photo area
          Container(
            height: 180,
            color: HomeColors.pureBlack,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.science_outlined,
                    color: HomeColors.grey700,
                    size: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '[SPECIMEN]',
                    style: HomeTypography.labelMedium.copyWith(
                      color: HomeColors.grey600,
                      fontSize: 10,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Label
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gravy.name,
                  style: HomeTypography.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  gravy.description,
                  style: HomeTypography.bodySmall.copyWith(
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}