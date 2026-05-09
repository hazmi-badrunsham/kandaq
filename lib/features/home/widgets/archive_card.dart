import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class ArchiveCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? meta;
  final VoidCallback? onTap;
  const ArchiveCard({super.key, required this.title, required this.subtitle, this.meta, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTypography.display),
            const SizedBox(height: 6),
            Text(subtitle, style: AppTypography.bodyMedium),
            if (meta != null) ...[
              const SizedBox(height: 8),
              Text(meta!, style: AppTypography.metaSmall),
            ],
          ],
        ),
      ),
    );
  }
}