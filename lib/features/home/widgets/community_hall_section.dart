import 'package:flutter/material.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';
import '../data/home_data.dart';

class CommunityHallSection extends StatelessWidget {
  const CommunityHallSection({super.key});

  @override
  Widget build(BuildContext context) {
    final photos = HomeData.userPhotos;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'COMMUNITY HALL',
            style: HomeTypography.labelMedium.copyWith(
              letterSpacing: 4.0,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Matriculation\nphotos.',
            style: HomeTypography.displayMedium.copyWith(
              height: 1.05,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Black & white only. Top-down only. Banana leaf required.',
            style: HomeTypography.bodyMedium.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 48),

          // Photo grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 0.75,
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              return _PhotoCard(photo: photo);
            },
          ),

          const SizedBox(height: 48),

          // Upload CTA
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: HomeColors.grey200,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  'SUBMIT YOUR PHOTO',
                  style: HomeTypography.labelLarge.copyWith(
                    letterSpacing: 3.0,
                    color: HomeColors.grey600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhotoCard extends StatelessWidget {
  final UserPhoto photo;

  const _PhotoCard({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Photo placeholder - desaturated
        Container(
          color: HomeColors.grey100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_camera_outlined,
                  color: HomeColors.grey300,
                  size: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  '[B&W]',
                  style: HomeTypography.bodySmall.copyWith(
                    fontSize: 8,
                    color: HomeColors.grey400,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Info overlay at bottom
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: HomeColors.pureBlack.withOpacity(0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  photo.username,
                  style: HomeTypography.bodySmall.copyWith(
                    color: HomeColors.pureWhite,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'at ${photo.shopName} · ${photo.timeAgo}',
                  style: HomeTypography.bodySmall.copyWith(
                    color: HomeColors.grey400,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}