import 'package:flutter/material.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';
import '../widgets/kandaq_header.dart';
import '../widgets/kandaq_navigation.dart';
import '../widgets/hero_section.dart';
import '../widgets/deans_list_bento.dart';
import '../widgets/campus_map_section.dart';
import '../widgets/gravy_library_section.dart';
import '../widgets/stats_bento_section.dart';
import '../widgets/community_hall_section.dart';
import '../widgets/alumni_footer_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;
  final ScrollController _scrollController = ScrollController();

  // Use GlobalKey for each section we want to track
  final List<GlobalKey> _sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  // Store section positions for scroll tracking
  final List<double> _sectionPositions = [0, 0, 0, 0];
  bool _isScrollingFromNav = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    
    // Calculate section positions after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateSectionPositions();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _calculateSectionPositions() {
    for (int i = 0; i < _sectionKeys.length; i++) {
      final context = _sectionKeys[i].currentContext;
      if (context != null) {
        final renderObject = context.findRenderObject();
        if (renderObject != null) {
          // Get global position of each section
          final box = renderObject as RenderBox;
          final position = box.localToGlobal(Offset.zero);
          
          // Convert to scroll offset by adding current scroll position
          _sectionPositions[i] = position.dy + _scrollController.offset;
        }
      }
    }
  }

  void _onScroll() {
    // Don't update nav while programmatically scrolling
    if (_isScrollingFromNav) return;

    // Recalculate positions sometimes (layout might change)
    _calculateSectionPositions();

    final scrollOffset = _scrollController.offset + 150; // offset buffer

    for (int i = _sectionPositions.length - 1; i >= 0; i--) {
      if (scrollOffset >= _sectionPositions[i]) {
        if (_currentNavIndex != i) {
          setState(() {
            _currentNavIndex = i;
          });
        }
        break;
      }
    }
  }

  Future<void> _onNavTap(int index) async {
    setState(() {
      _currentNavIndex = index;
    });

    // Scroll to section
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      _isScrollingFromNav = true;

      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
        alignment: 0.05, // Small offset from top
      );

      // Small delay to let scroll settle
      await Future.delayed(const Duration(milliseconds: 700));
      _isScrollingFromNav = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColors.background,
      body: Column(
        children: [
          // Header
          KandaqHeader(
            onEnrollTap: () => _onNavTap(3),
          ),

          // Scrollable body
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Hero Section
                SliverToBoxAdapter(
                  child: HeroSection(
                    onEnrollTap: () => _onNavTap(3),
                  ),
                ),

                // Dean's List - Section 0
                SliverToBoxAdapter(
                  key: _sectionKeys[0],
                  child: const DeansListBento(),
                ),

                // Quote divider
                SliverToBoxAdapter(
                  child: Container(
                    color: HomeColors.grey50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 64,
                    ),
                    child: Text(
                      '"The bendi here could make a grown man weep."',
                      style: HomeTypography.quoteLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // Campus Map - Section 1
                SliverToBoxAdapter(
                  key: _sectionKeys[1],
                  child: const CampusMapSection(),
                ),

                // Gravy Library
                SliverToBoxAdapter(
                  child: const GravyLibrarySection(),
                ),

                // Stats Report Card
                SliverToBoxAdapter(
                  child: const StatsBentoSection(),
                ),

                // Community Hall - Section 2
                SliverToBoxAdapter(
                  key: _sectionKeys[2],
                  child: const CommunityHallSection(),
                ),

                // Alumni Footer - Section 3
                SliverToBoxAdapter(
                  key: _sectionKeys[3],
                  child: const AlumniFooterSection(),
                ),
              ],
            ),
          ),

          // Bottom Navigation
          KandaqNavigation(
            currentIndex: _currentNavIndex,
            onTap: _onNavTap,
          ),
        ],
      ),
    );
  }
}