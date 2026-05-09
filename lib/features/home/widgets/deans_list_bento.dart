import 'package:flutter/material.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';
import '../data/home_data.dart';

class DeansListBento extends StatelessWidget {
  const DeansListBento({super.key});

  @override
  Widget build(BuildContext context) {
    final shops = HomeData.deansList;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Text(
            'DEAN\'S LIST',
            style: HomeTypography.labelMedium.copyWith(
              letterSpacing: 4.0,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'This semester\'s\nhonour roll.',
            style: HomeTypography.displayMedium.copyWith(
              height: 1.05,
            ),
          ),
          const SizedBox(height: 64),

          // Bento Grid - 1 large + 4 small
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;

              if (isWide) {
                return _buildWideLayout(shops);
              } else {
                return _buildNarrowLayout(shops);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout(List<ShopData> shops) {
    return SizedBox(
      height: 520,
      child: Row(
        children: [
          // Large featured card (shop 0)
          Expanded(
            flex: 5,
            child: _LargeShopCard(shop: shops[0]),
          ),
          const SizedBox(width: 16),

          // Right grid - 2x2
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: _SmallShopCard(shop: shops[1])),
                      const SizedBox(width: 16),
                      Expanded(child: _SmallShopCard(shop: shops[2])),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: _SmallShopCard(shop: shops[3])),
                      const SizedBox(width: 16),
                      Expanded(child: _SmallShopCard(shop: shops[4])),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(List<ShopData> shops) {
    return Column(
      children: [
        _LargeShopCard(shop: shops[0]),
        const SizedBox(height: 16),
        for (final shop in shops.skip(1)) ...[
          _SmallShopCard(shop: shop),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}

class _LargeShopCard extends StatelessWidget {
  final ShopData shop;

  const _LargeShopCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HomeColors.grey50,
        border: Border.all(color: HomeColors.grey100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            flex: 6,
            child: Container(
              color: HomeColors.grey800,
              child: Center(
                child: Text(
                  '[${shop.name} photo]',
                  style: HomeTypography.bodySmall.copyWith(
                    color: HomeColors.grey400,
                  ),
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Grade badge
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: HomeColors.pureBlack),
                    ),
                    child: Text(
                      'Grade: ${shop.grade}',
                      style: HomeTypography.labelMedium.copyWith(
                        color: HomeColors.pureBlack,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const Spacer(),

                  // Shop name
                  Text(
                    shop.name,
                    style: HomeTypography.headlineMedium,
                  ),
                  const SizedBox(height: 4),

                  // Award
                  Text(
                    shop.award,
                    style: HomeTypography.bodySmall.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 14, color: HomeColors.grey400),
                      const SizedBox(width: 4),
                      Text(
                        shop.location,
                        style: HomeTypography.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallShopCard extends StatelessWidget {
  final ShopData shop;

  const _SmallShopCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HomeColors.grey50,
        border: Border.all(color: HomeColors.grey100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            flex: 5,
            child: Container(
              color: HomeColors.grey800,
              child: Center(
                child: Text(
                  '[Photo]',
                  style: HomeTypography.bodySmall.copyWith(
                    color: HomeColors.grey400,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Grade: ${shop.grade}',
                    style: HomeTypography.labelMedium.copyWith(
                      fontSize: 9,
                      color: HomeColors.grey500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    shop.name,
                    style: HomeTypography.headlineSmall.copyWith(
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    shop.award,
                    style: HomeTypography.bodySmall.copyWith(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}