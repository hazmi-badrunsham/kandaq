import 'package:flutter/material.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';

class AlumniFooterSection extends StatefulWidget {
  const AlumniFooterSection({super.key});

  @override
  State<AlumniFooterSection> createState() => _AlumniFooterSectionState();
}

class _AlumniFooterSectionState extends State<AlumniFooterSection> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HomeColors.pureBlack,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 96),
        child: Column(
          children: [
            // Newsletter
            Text(
              'ALUMNI AFFAIRS',
              style: HomeTypography.labelMedium.copyWith(
                color: HomeColors.grey400,
                letterSpacing: 4.0,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'For graduates and\ngravy scholars only.',
              style: HomeTypography.displaySmall.copyWith(
                color: HomeColors.pureWhite,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Weekly dispatches on the kuah economy. New shops.\nGrade changes. Limited releases.',
              style: HomeTypography.bodyMedium.copyWith(
                color: HomeColors.grey500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            // Email signup
            SizedBox(
              width: 460,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: HomeColors.grey700,
                            width: 1,
                          ),
                        ),
                      ),
                      child: TextField(
                        controller: _controller,
                        style: HomeTypography.bodyMedium.copyWith(
                          color: HomeColors.pureWhite,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Your email address',
                          hintStyle: HomeTypography.bodyMedium.copyWith(
                            color: HomeColors.grey600,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: HomeColors.pureWhite,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        'MATRICULATE',
                        style: HomeTypography.labelLarge.copyWith(
                          color: HomeColors.pureWhite,
                          letterSpacing: 3.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // Divider
            Container(
              width: 60,
              height: 2,
              color: HomeColors.grey800,
            ),
            const SizedBox(height: 48),

            // Bottom links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _FooterLink(label: 'About Kandaq'),
                const SizedBox(width: 32),
                _FooterLink(label: 'Privacy'),
                const SizedBox(width: 32),
                _FooterLink(label: 'Terms'),
                const SizedBox(width: 32),
                _FooterLink(label: 'Contact'),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Kandaq © 2026 · Sekolah Nasi Kandar',
              style: HomeTypography.bodySmall.copyWith(
                color: HomeColors.grey600,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;

  const _FooterLink({required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        label,
        style: HomeTypography.bodySmall.copyWith(
          color: HomeColors.grey500,
          fontSize: 12,
        ),
      ),
    );
  }
}