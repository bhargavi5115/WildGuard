import 'package:flutter/material.dart';
import '../services/favorites_service.dart';
import '../theme/app_theme.dart';
import 'about_screen.dart';
import 'conservation_screen.dart';
import 'favorites_screen.dart';
import 'gallery_screen.dart';

/// MainNavigationScreen coordinates the primary application navigation scaffold.
///
/// Houses four key conservation sections:
/// 1. Gallery: The responsive species grid with real-time search, filters, and spotlight.
/// 2. Favourites: Locally persisted personal wildlife watchlist.
/// 3. Conservation: Planetary threats, citizen actions, and UN SDG 15 alignment.
/// 4. About: App mission, scientific standards, and Wikimedia Commons attributions.
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  final FavoritesService _favoritesService = FavoritesService();

  @override
  void initState() {
    super.initState();
    _favoritesService.init();
  }

  void _navigateToTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      GalleryScreen(
        onNavigateToConservation: () => _navigateToTab(2),
        onNavigateToFavorites: () => _navigateToTab(1),
        favoritesService: _favoritesService,
      ),
      FavoritesScreen(
        favoritesService: _favoritesService,
        onNavigateToGallery: () => _navigateToTab(0),
      ),
      const ConservationScreen(),
      const AboutScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: _navigateToTab,
          backgroundColor: Colors.white,
          indicatorColor: AppTheme.paleSage,
          elevation: 0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.grid_view_rounded),
              selectedIcon: Icon(Icons.grid_view_rounded, color: AppTheme.forestGreen),
              label: 'Gallery',
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark_outline_rounded),
              selectedIcon: Icon(Icons.bookmark_rounded, color: AppTheme.forestGreen),
              label: 'Favourites',
            ),
            NavigationDestination(
              icon: Icon(Icons.shield_outlined),
              selectedIcon: Icon(Icons.shield_rounded, color: AppTheme.forestGreen),
              label: 'Conservation',
            ),
            NavigationDestination(
              icon: Icon(Icons.info_outline_rounded),
              selectedIcon: Icon(Icons.info_rounded, color: AppTheme.forestGreen),
              label: 'About',
            ),
          ],
        ),
      ),
    );
  }
}
