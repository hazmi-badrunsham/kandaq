import 'package:flutter/material.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';
import '../data/home_data.dart';

class StatsBentoSection extends StatelessWidget {
  const StatsBentoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = HomeData.statsGrid;

    return Container(
      color: HomeColors.pureBlack,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REPORT CARD',
                    style: HomeTypography.labelMedium.copyWith(
                      letterSpacing: 4.0,
                      color: HomeColors.grey400,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Your academic\nstanding.',
                    style: HomeTypography.displayMedium.copyWith(
                      color: HomeColors.pureWhite,
                      height: 1.05,
                    ),
                  ),
                ],
              ),
            ),

            // Bento Grid 3x2
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 700;
                final crossAxisCount = isWide ? 3 : 2;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: stats.length,
                  itemBuilder: (context, index) {
                    return _StatsCard(stat: stats[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  final StatData stat;

  const _StatsCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HomeColors.grey900,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            stat.number,
            style: HomeTypography.statNumber.copyWith(
              color: HomeColors.pureWhite,
              fontSize: 42,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            stat.label,
            style: HomeTypography.bodyMedium.copyWith(
              color: HomeColors.grey200,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat.sublabel,
            style: HomeTypography.bodySmall.copyWith(
              color: HomeColors.grey500,
              fontStyle: FontStyle.italic,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}