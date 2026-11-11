import 'package:flutter/material.dart';
import '../data/species_data.dart';
import '../models/species.dart';
import '../models/wikimedia_image.dart';
import '../services/favorites_service.dart';
import '../services/wikimedia_service.dart';
import '../theme/app_theme.dart';
import '../widgets/category_filter.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/species_card.dart';
import '../widgets/species_image.dart';
import 'species_detail_screen.dart';

/// GalleryScreen is the primary discovery hub of WildGuard.
///
/// Demonstrates the core required Flutter widgets:
/// - [GridView.builder] / [SliverGrid] for responsive, memory-efficient wildlife gallery browsing.
/// - [Image] ([Image.asset] / [Image.network]) for rendering wildlife photography with graceful fallbacks.
/// - [Text] for hierarchy (headlines, scientific names, statuses, and educational copy).
/// - [TextField] for real-time name, habitat, and keyword search.
/// - [ChoiceChip] for taxonomic category filtering.
class GalleryScreen extends StatefulWidget {
  final VoidCallback onNavigateToConservation;
  final VoidCallback? onNavigateToFavorites;
  final FavoritesService? favoritesService;

  const GalleryScreen({
    super.key,
    required this.onNavigateToConservation,
    this.onNavigateToFavorites,
    this.favoritesService,
  });

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final TextEditingController _searchController = TextEditingController();
  final WikimediaService _wikimediaService = WikimediaService();
  String _searchQuery = '';
  String _selectedCategory = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    _wikimediaService.dispose();
    super.dispose();
  }

  /// Calculates responsive cross-axis column count based on screen width.
  int _calculateCrossAxisCount(double screenWidth) {
    if (screenWidth > 950) {
      return 4; // Large desktop displays
    } else if (screenWidth > 650) {
      return 3; // Tablets & horizontal view
    } else {
      return 2; // Standard mobile screens (2 columns)
    }
  }

  /// Computes appropriate aspect ratio for grid cards based on screen width.
  double _calculateChildAspectRatio(double screenWidth) {
    if (screenWidth > 950) {
      return 0.76;
    } else if (screenWidth > 650) {
      return 0.74;
    } else {
      return 0.72; // Optimized for 2-column mobile portrait
    }
  }

  /// Filters the master dataset based on search text and taxonomic category.
  List<Species> get _filteredSpecies {
    return SpeciesData.allSpecies.where((species) {
      final matchesSearch = species.matchesSearchQuery(_searchQuery);
      final matchesCat = species.matchesCategory(_selectedCategory);
      return matchesSearch && matchesCat;
    }).toList();
  }

  /// Curated featured species for the top spotlight carousel.
  List<Species> get _featuredSpecies {
    const featuredIds = ['amur_leopard', 'mountain_gorilla', 'hawksbill_turtle', 'bengal_tiger', 'axolotl'];
    return SpeciesData.allSpecies.where((s) => featuredIds.contains(s.id)).toList();
  }

  void _resetFilters() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
      _selectedCategory = 'All';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _calculateCrossAxisCount(screenWidth);
    final childAspectRatio = _calculateChildAspectRatio(screenWidth);
    final filteredList = _filteredSpecies;

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
                Icons.forest_rounded,
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
                    'WildGuard',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.forestGreen,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Text(
                    'Discover • Protect • Preserve',
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
        actions: [
          if (widget.favoritesService != null && widget.onNavigateToFavorites != null)
            ListenableBuilder(
              listenable: widget.favoritesService!,
              builder: (context, _) {
                final favCount = widget.favoritesService!.count;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.bookmark_rounded, color: AppTheme.forestGreen),
                      tooltip: 'View Favourites',
                      onPressed: widget.onNavigateToFavorites,
                    ),
                    if (favCount > 0)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppTheme.statusCriticallyEndangered,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                          child: Text(
                            '$favCount',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.travel_explore_rounded, color: AppTheme.forestGreen),
            tooltip: 'Explore Wikimedia Commons Wildlife Photos',
            onPressed: () => _showWikimediaSearchDialog(context),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Header Section: Welcome Title & Subtitle
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore Our Precious Wildlife',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textDark,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Discover threatened and critically endangered species around the globe. Learn about their habitats, challenges, and practical conservation efforts.',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: AppTheme.textMuted,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Featured Conservation Banner
                  _buildConservationBanner(context),
                  const SizedBox(height: 16),

                  // Prominent Search Bar
                  SearchBarWidget(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    onClear: () {
                      setState(() {
                        _searchController.clear();
                        _searchQuery = '';
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),

          // Horizontal Category Filter Chips
          SliverToBoxAdapter(
            child: CategoryFilter(
              categories: SpeciesData.categories,
              selectedCategory: _selectedCategory,
              onSelected: (newCategory) {
                setState(() {
                  _selectedCategory = newCategory;
                });
              },
            ),
          ),

          // Featured Species Spotlight (Shown when no search filter active)
          if (_searchQuery.isEmpty && _selectedCategory == 'All') ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
                child: Row(
                  children: const [
                    Icon(Icons.star_rounded, color: AppTheme.goldAccent, size: 20),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Featured Spotlight',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ),
                    Text(
                      'High Extinction Risk',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 168,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _featuredSpecies.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final species = _featuredSpecies[index];
                    return _buildFeaturedCard(species);
                  },
                ),
              ),
            ),
          ],

          // Filter Result Count & Reset Quick Action
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Showing ${filteredList.length} species',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.forestGreen,
                      ),
                    ),
                  ),
                  if (_searchQuery.isNotEmpty || _selectedCategory != 'All')
                    GestureDetector(
                      onTap: _resetFilters,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.restart_alt_rounded, size: 16, color: AppTheme.terracotta),
                          SizedBox(width: 4),
                          Text(
                            'Reset filters',
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.terracotta,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Main Gallery: Flutter GridView.builder Demonstration
          if (filteredList.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: _buildEmptyState(),
            )
          else
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
                    final species = filteredList[index];
                    final isFav = widget.favoritesService?.isFavorite(species.id) ?? false;

                    return SpeciesCard(
                      species: species,
                      isFavorite: isFav,
                      onFavoriteToggle: widget.favoritesService != null
                          ? () => widget.favoritesService!.toggleFavorite(species.id)
                          : null,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SpeciesDetailScreen(
                              species: species,
                              favoritesService: widget.favoritesService,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  childCount: filteredList.length,
                ),
              ),
            ),

          // Bottom padding
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
        ],
      ),
    );
  }

  /// Spotlight Card for the featured carousel.
  Widget _buildFeaturedCard(Species species) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SpeciesDetailScreen(
              species: species,
              favoritesService: widget.favoritesService,
            ),
          ),
        );
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SpeciesImage(
              species: species,
              fit: BoxFit.cover,
              darkFallback: true,
              compact: true,
            ),
            // Gradient Overlay
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.2),
                    Colors.black.withValues(alpha: 0.75),
                  ],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: species.conservationStatus.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        species.conservationStatus.code,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        species.commonName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        species.scientificName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Featured Conservation Banner highlighting SDG 15 and wildlife protection.
  Widget _buildConservationBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.forestGreen,
            AppTheme.pineGreen,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.forestGreen.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.eco_rounded,
              color: AppTheme.paleSage,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'SDG 15: Life on Land',
                  style: TextStyle(
                    color: AppTheme.paleSage,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Protecting Earth\'s Biodiversity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Over 1 million species face extinction risk. Learn what we can do to protect them.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
            tooltip: 'Learn more about conservation',
            onPressed: widget.onNavigateToConservation,
          ),
        ],
      ),
    );
  }

  /// Empty state widget shown when no species matches the filter/query.
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.paleSage.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search_off_rounded,
                size: 54,
                color: AppTheme.pineGreen,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'No Species Found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _searchQuery.isNotEmpty
                  ? 'No results match "$_searchQuery" in $_selectedCategory category.'
                  : 'No species found for the selected category.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13.5,
                color: AppTheme.textMuted,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _resetFilters,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Reset All Filters'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.forestGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

  /// Interactive dialog enabling users to query the wider Wikimedia Commons repository.
  void _showWikimediaSearchDialog(BuildContext context) {
    final searchCtrl = TextEditingController(text: _searchQuery);
    List<WikimediaImage> results = [];
    bool isSearching = false;
    String? errorMessage;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setModalState) {
            void performSearch() async {
              final query = searchCtrl.text.trim();
              if (query.isEmpty) return;

              setModalState(() {
                isSearching = true;
                errorMessage = null;
              });

              try {
                final imgs = await _wikimediaService.searchImages(query, limit: 12);
                setModalState(() {
                  results = imgs;
                  isSearching = false;
                  if (imgs.isEmpty) {
                    errorMessage = 'No photographs found on Wikimedia Commons for "$query".';
                  }
                });
              } catch (e) {
                setModalState(() {
                  isSearching = false;
                  errorMessage = 'Network connection unavailable. Operating in offline mode.';
                });
              }
            }

            return DraggableScrollableSheet(
              initialChildSize: 0.85,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              builder: (ctx, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppTheme.dividerColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.travel_explore_rounded, color: AppTheme.forestGreen, size: 22),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    'Wikimedia Commons Wildlife Explorer',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                      color: AppTheme.forestGreen,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close_rounded),
                                  onPressed: () => Navigator.of(ctx).pop(),
                                ),
                              ],
                            ),
                            const Text(
                              'Search millions of public-domain and Creative Commons wildlife photos retrieved via the official Commons API.',
                              style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: searchCtrl,
                                    textInputAction: TextInputAction.search,
                                    onSubmitted: (_) => performSearch(),
                                    decoration: InputDecoration(
                                      hintText: 'Enter wildlife species or animal keyword...',
                                      prefixIcon: const Icon(Icons.search_rounded, color: AppTheme.forestGreen),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.clear_rounded, size: 18),
                                        onPressed: () => setModalState(() => searchCtrl.clear()),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: performSearch,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.forestGreen,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                  ),
                                  child: const Text('Search'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1, color: AppTheme.dividerColor),
                      Expanded(
                        child: isSearching
                            ? const Center(child: CircularProgressIndicator(color: AppTheme.forestGreen))
                            : errorMessage != null
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(24),
                                      child: Text(
                                        errorMessage!,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: AppTheme.textMuted, fontSize: 13.5),
                                      ),
                                    ),
                                  )
                                : results.isEmpty
                                    ? Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                              Icon(Icons.photo_library_outlined, size: 48, color: AppTheme.textLight),
                                              SizedBox(height: 10),
                                              Text(
                                                'Enter a species name or animal term above to search Wikimedia Commons live photographs.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : GridView.builder(
                                        controller: scrollController,
                                        padding: const EdgeInsets.all(16),
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.85,
                                          crossAxisSpacing: 12,
                                          mainAxisSpacing: 12,
                                        ),
                                        itemCount: results.length,
                                        itemBuilder: (ctx, i) {
                                          final img = results[i];
                                          return Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              side: const BorderSide(color: AppTheme.dividerColor),
                                            ),
                                            clipBehavior: Clip.antiAlias,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Image.network(
                                                    img.thumbUrl,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (c, e, s) => Container(
                                                      color: AppTheme.paleSage,
                                                      child: const Center(
                                                        child: Icon(Icons.broken_image_rounded),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        img.cleanTitle,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w700,
                                                          color: AppTheme.textDark,
                                                        ),
                                                      ),
                                                      Text(
                                                        img.license,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                          fontSize: 10.5,
                                                          color: AppTheme.textMuted,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
