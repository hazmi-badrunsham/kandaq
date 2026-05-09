import 'package:flutter/material.dart';
import '../data/home_data.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class RegionScroller extends StatelessWidget {
  const RegionScroller({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: HomeData.regions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final r = HomeData.regions[i];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(r['name'] as String, style: AppTypography.bodyMedium),
                const SizedBox(width: 8),
                Text('${r['rating']}★', style: AppTypography.metaSmall),
                const SizedBox(width: 6),
                Text('(${r['count']})', style: AppTypography.metaSmall),
              ],
            ),
          );
        },
      ),
    );
  }
}