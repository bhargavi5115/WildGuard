import 'package:flutter/material.dart';
import '../data/species_data.dart';
import '../services/favorites_service.dart';
import '../theme/app_theme.dart';
import '../widgets/species_card.dart';
import 'species_detail_screen.dart';

/// FavoritesScreen displays species marked as favourites by the user.
///
/// Automatically synchronizes with [FavoritesService] and persists locally
/// without requiring an account or network connection.
class FavoritesScreen extends StatelessWidget {
  final FavoritesService favoritesService;
  final VoidCallback onNavigateToGallery;

  const FavoritesScreen({
    super.key,
    required this.favoritesService,
    required this.onNavigateToGallery,
  });

  int _calculateCrossAxisCount(double screenWidth) {
    if (screenWidth > 950) {
      return 4;
    } else if (screenWidth > 650) {
      return 3;
    } else {
      return 2;
    }
  }

  double _calculateChildAspectRatio(double screenWidth) {
    if (screenWidth > 950) {
      return 0.76;
    } else if (screenWidth > 650) {
      return 0.74;
    } else {
      return 0.72;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _calculateCrossAxisCount(screenWidth);
    final childAspectRatio = _calculateChildAspectRatio(screenWidth);

    return ListenableBuilder(
      listenable: favoritesService,
      builder: (context, _) {
        final favoriteSpecies =
            favoritesService.filterFavoriteSpecies(SpeciesData.allSpecies);

        return Scaffold(
          backgroundColor: AppTheme.warmOffWhite,
          appBar: AppBar(
            titleSpacing: 16,
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: AppTheme.paleSage,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.bookmark_rounded,
                    color: AppTheme.forestGreen,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saved Favourites',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.forestGreen,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'Your Personal Wildlife Watchlist',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.emeraldGreen,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: favoriteSpecies.isEmpty
              ? _buildEmptyState(context)
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
                        child: Text(
                          'Showing ${favoriteSpecies.length} saved ${favoriteSpecies.length == 1 ? "species" : "species"}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.forestGreen,
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          childAspectRatio: childAspectRatio,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final species = favoriteSpecies[index];
                            return SpeciesCard(
                              species: species,
                              isFavorite: true,
                              onFavoriteToggle: () =>
                                  favoritesService.toggleFavorite(species.id),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SpeciesDetailScreen(
                                      species: species,
                                      favoritesService: favoritesService,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          childCount: favoriteSpecies.length,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 32),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppTheme.paleSage.withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.bookmark_border_rounded,
                size: 58,
                color: AppTheme.pineGreen,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'No Favourites Saved Yet',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the bookmark icon on any species card or detail screen to keep track of animals you want to follow.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.5,
                color: AppTheme.textMuted,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 22),
            ElevatedButton.icon(
              onPressed: onNavigateToGallery,
              icon: const Icon(Icons.grid_view_rounded, size: 18),
              label: const Text('Explore Wildlife Gallery'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.forestGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
