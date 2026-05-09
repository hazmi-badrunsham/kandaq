import 'package:flutter/material.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onEnrollTap;

  const HeroSection({
    super.key,
    required this.onEnrollTap,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 65, // minus header
      child: Stack(
        children: [
          // Background Image with heavy overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: HomeColors.pureBlack,
              ),
              child: Opacity(
                opacity: 0.6,
                child: Image.network(
                  'https://images.unsplash.com/photo-1594322436404-5aaf6c1e9042?w=1200',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.multiply,
                  color: HomeColors.pureBlack,
                ),
              ),
            ),
          ),

          // Grain overlay
          Positioned.fill(
            child: Container(
              color: HomeColors.pureBlack.withOpacity(0.15),
            ),
          ),

          // Content
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 80),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Top label
                      Text(
                        'SEMESTER 2026',
                        style: HomeTypography.labelMedium.copyWith(
                          color: HomeColors.grey300,
                          letterSpacing: 4.0,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Main headline
                      Text(
                        'Sekolah\nNasi Kandar',
                        style: HomeTypography.displayLarge.copyWith(
                          color: HomeColors.pureWhite,
                          fontSize: 88,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Subheadline - editorial style
                      Text(
                        'Matriculation is now open.\nDiscover the masters of kuah campur.',
                        style: HomeTypography.bodyLarge.copyWith(
                          color: HomeColors.grey200,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 56),

                      // Enroll button
                      GestureDetector(
                        onTap: widget.onEnrollTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 36,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: HomeColors.pureWhite,
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'ENROLL NOW',
                                style: HomeTypography.labelLarge.copyWith(
                                  color: HomeColors.pureWhite,
                                  letterSpacing: 4.0,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.arrow_forward,
                                color: HomeColors.pureWhite,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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