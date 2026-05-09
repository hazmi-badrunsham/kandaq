import 'package:flutter/material.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';
import '../data/home_data.dart';

class CampusMapSection extends StatefulWidget {
  const CampusMapSection({super.key});

  @override
  State<CampusMapSection> createState() => _CampusMapSectionState();
}

class _CampusMapSectionState extends State<CampusMapSection> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HomeColors.pureBlack,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CAMPUS MAP',
              style: HomeTypography.labelMedium.copyWith(
                letterSpacing: 4.0,
                color: HomeColors.grey400,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Find your\ncanteen.',
              style: HomeTypography.displayMedium.copyWith(
                color: HomeColors.pureWhite,
                height: 1.05,
              ),
            ),
            const SizedBox(height: 48),

            // Map placeholder
            Container(
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: HomeColors.grey800),
                color: HomeColors.grey900,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      size: 64,
                      color: HomeColors.grey700,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Interactive Map\nwith academic seal pins',
                      style: HomeTypography.bodyMedium.copyWith(
                        color: HomeColors.grey500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),

            // Location list under map
            ...List.generate(
              HomeData.deansList.length,
              (index) => _LocationRow(
                shop: HomeData.deansList[index],
                isExpanded: _selectedIndex == index,
                onTap: () {
                  setState(() {
                    _selectedIndex =
                        _selectedIndex == index ? null : index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationRow extends StatelessWidget {
  final ShopData shop;
  final bool isExpanded;
  final VoidCallback onTap;

  const _LocationRow({
    required this.shop,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.only(bottom: 1),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: isExpanded ? HomeColors.grey900 : HomeColors.pureBlack,
          border: Border(
            bottom: BorderSide(color: HomeColors.grey800, width: 1),
          ),
        ),
        child: Row(
          children: [
            // Grade seal
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: HomeColors.pureWhite,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  shop.grade,
                  style: HomeTypography.labelLarge.copyWith(
                    color: HomeColors.pureWhite,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),

            // Shop info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shop.name,
                    style: HomeTypography.headlineSmall.copyWith(
                      color: HomeColors.pureWhite,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${shop.location} · ${shop.legendaryDish}',
                    style: HomeTypography.bodySmall.copyWith(
                      color: HomeColors.grey500,
                    ),
                  ),
                ],
              ),
            ),

            // Expand indicator
            AnimatedRotation(
              turns: isExpanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                Icons.chevron_right,
                color: HomeColors.grey500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}