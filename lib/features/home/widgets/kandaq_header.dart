import 'package:flutter/material.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';

class KandaqHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onEnrollTap;

  const KandaqHeader({
    super.key,
    this.onMenuTap,
    this.onEnrollTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: const BoxDecoration(
        color: HomeColors.pureWhite,
        border: Border(
          bottom: BorderSide(
            color: HomeColors.grey100,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo / Wordmark
          Text(
            'KANDAQ',
            style: HomeTypography.labelLarge.copyWith(
              letterSpacing: 4.0,
            ),
          ),

          // Right section
          Row(
            children: [
              // Menu button
              _HeaderButton(
                label: 'Menu',
                onTap: onMenuTap ?? () {},
              ),
              const SizedBox(width: 24),

              // Enroll CTA
              GestureDetector(
                onTap: onEnrollTap ?? () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: HomeColors.pureBlack,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    'ENROLL NOW',
                    style: HomeTypography.labelLarge.copyWith(
                      fontSize: 12,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class _HeaderButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _HeaderButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: HomeTypography.labelMedium.copyWith(
          color: HomeColors.grey600,
        ),
      ),
    );
  }
}