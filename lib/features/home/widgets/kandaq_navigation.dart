import 'package:flutter/material.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';
import '../data/home_data.dart';

class KandaqNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const KandaqNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration: const BoxDecoration(
        color: HomeColors.pureWhite,
        border: Border(
          top: BorderSide(
            color: HomeColors.grey100,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(HomeData.navItems.length, (index) {
          final item = HomeData.navItems[index];
          final isSelected = currentIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item['label']!,
                    style: HomeTypography.labelMedium.copyWith(
                      color: isSelected
                          ? HomeColors.pureBlack
                          : HomeColors.grey300,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? HomeColors.pureBlack
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}