import 'package:flutter/material.dart';
import '../models/species.dart';
import '../models/wikimedia_image.dart';
import '../services/favorites_service.dart';
import '../services/wikimedia_service.dart';
import '../theme/app_theme.dart';
import '../widgets/conservation_status_badge.dart';
import '../widgets/species_image.dart';

/// SpeciesDetailScreen displays comprehensive verified conservation facts, threats,
/// ecological overview, and dynamically retrieved Wikimedia Commons wildlife photography.
class SpeciesDetailScreen extends StatefulWidget {
  final Species species;
  final FavoritesService? favoritesService;

  const SpeciesDetailScreen({
    super.key,
    required this.species,
    this.favoritesService,
  });

  @override
  State<SpeciesDetailScreen> createState() => _SpeciesDetailScreenState();
}

class _SpeciesDetailScreenState extends State<SpeciesDetailScreen> {
  late bool _isBookmarked;
  final WikimediaService _wikimediaService = WikimediaService();
  List<WikimediaImage> _commonsImages = [];
  bool _isLoadingCommons = true;
  String? _commonsError;

  @override
  void initState() {
    super.initState();
    _isBookmarked = widget.favoritesService?.isFavorite(widget.species.id) ?? false;
    _fetchWikimediaImages();
  }

  @override
  void dispose() {
    _wikimediaService.dispose();
    super.dispose();
  }

  Future<void> _fetchWikimediaImages() async {
    setState(() {
      _isLoadingCommons = true;
      _commonsError = null;
    });

    try {
      // Query official Wikimedia Commons using binomial scientific name and common name
      final results = await _wikimediaService.searchImages(
        widget.species.scientificName,
        limit: 6,
      );

      if (mounted) {
        setState(() {
          _commonsImages = results;
          _isLoadingCommons = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _commonsError = 'Unable to load live Wikimedia Commons photos in offline mode.';
          _isLoadingCommons = false;
        });
      }
    }
  }

  Future<void> _toggleBookmark() async {
    final species = widget.species;
    final bool newState;

    if (widget.favoritesService != null) {
      newState = await widget.favoritesService!.toggleFavorite(species.id);
    } else {
      newState = !_isBookmarked;
    }

    if (mounted) {
      setState(() {
        _isBookmarked = newState;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                _isBookmarked ? Icons.bookmark_added_rounded : Icons.bookmark_remove_rounded,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  _isBookmarked
                      ? '${species.commonName} saved to Favourites.'
                      : '${species.commonName} removed from Favourites.',
                ),
              ),
            ],
          ),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final species = widget.species;

    return Scaffold(
      backgroundColor: AppTheme.warmOffWhite,
      body: CustomScrollView(
        slivers: [
          // Collapsible Sliver AppBar with Full Photography
          SliverAppBar(
            expandedHeight: 330,
            pinned: true,
            stretch: true,
            backgroundColor: AppTheme.forestGreen,
            foregroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black.withValues(alpha: 0.45),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                  tooltip: 'Back to Gallery',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withValues(alpha: 0.45),
                  child: IconButton(
                    icon: Icon(
                      _isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                      color: _isBookmarked ? AppTheme.goldAccent : Colors.white,
                    ),
                    tooltip: _isBookmarked ? 'Remove Bookmark' : 'Bookmark Species',
                    onPressed: _toggleBookmark,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  _buildHeaderImage(species),
                  // Dark gradient overlay for text readability
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.35),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.8),
                        ],
                        stops: const [0.0, 0.4, 1.0],
                      ),
                    ),
                  ),
                  // Bottom title & category overlay inside flexible bar
                  Positioned(
                    bottom: 16,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.forestGreen.withValues(alpha: 0.9),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppTheme.goldAccent.withValues(alpha: 0.6),
                                  width: 0.8,
                                ),
                              ),
                              child: Text(
                                species.category.toUpperCase(),
                                style: const TextStyle(
                                  color: AppTheme.paleSage,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          species.commonName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.3,
                            shadows: [
                              Shadow(
                                color: Colors.black87,
                                offset: Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          species.scientificName,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Scrollable Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Conservation Status Card
                  _buildStatusCard(species),
                  const SizedBox(height: 20),

                  // Quick Key Metrics (Population, Habitat, Diet, Distribution)
                  _buildQuickStats(species),
                  const SizedBox(height: 24),

                  // Section: Description Overview
                  _buildSectionHeader('Overview & Ecological Role', Icons.article_rounded),
                  const SizedBox(height: 10),
                  Text(
                    species.description,
                    style: const TextStyle(
                      fontSize: 14.5,
                      height: 1.6,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // "Did You Know?" Fact Callout Box
                  _buildDidYouKnowBox(species),
                  const SizedBox(height: 24),

                  // Section: Main Survival Threats
                  _buildSectionHeader('Critical Threats to Survival', Icons.warning_amber_rounded),
                  const SizedBox(height: 12),
                  ...species.threats.map((threat) => _buildThreatItem(threat)),
                  const SizedBox(height: 24),

                  // Section: Active Conservation Measures
                  _buildSectionHeader('Current Conservation Measures', Icons.security_rounded),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.dividerColor),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.verified_rounded,
                          color: AppTheme.emeraldGreen,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            species.conservationAction,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: AppTheme.textDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Section: How You Can Help
                  _buildSectionHeader('How You Can Help Protect Them', Icons.volunteer_activism_rounded),
                  const SizedBox(height: 12),
                  ...species.howYouCanHelp.map((action) => _buildHelpItem(action)),
                  const SizedBox(height: 28),

                  // Section: Wikimedia Commons Photography Integration
                  _buildWikimediaSection(),
                  const SizedBox(height: 32),

                  // Image Attribution & Reference Footnote
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.dividerColor),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Wildlife Photography Attribution:\n${species.imageAttribution}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: AppTheme.textMuted,
                              height: 1.45,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Taxonomy & Conservation Reference: ${species.sourceReference}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.forestGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderImage(Species species) {
    return SpeciesImage(
      species: species,
      fit: BoxFit.cover,
      darkFallback: true,
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.forestGreen, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusCard(Species species) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: species.conservationStatus.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: species.conservationStatus.color.withValues(alpha: 0.4),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'IUCN Red List Status',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ConservationStatusBadge(
                status: species.conservationStatus,
                compact: false,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            species.conservationStatus.definition,
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: AppTheme.textDark.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats(Species species) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        children: [
          _buildStatRow(
            Icons.people_alt_rounded,
            'Population in the Wild',
            species.populationEstimate.isNotEmpty ? species.populationEstimate : 'Information unavailable',
          ),
          const Divider(color: AppTheme.dividerColor, height: 20),
          _buildStatRow(
            Icons.public_rounded,
            'Geographic Distribution',
            species.geographicDistribution.isNotEmpty ? species.geographicDistribution : 'Information unavailable',
          ),
          const Divider(color: AppTheme.dividerColor, height: 20),
          _buildStatRow(
            Icons.landscape_rounded,
            'Native Habitat',
            species.habitat.isNotEmpty ? species.habitat : 'Information unavailable',
          ),
          const Divider(color: AppTheme.dividerColor, height: 20),
          _buildStatRow(
            Icons.restaurant_rounded,
            'Dietary Classification',
            species.diet.isNotEmpty ? species.diet : 'Information unavailable',
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.paleSage,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppTheme.forestGreen, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textMuted,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textDark,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDidYouKnowBox(Species species) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF8F2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.sageGreen.withValues(alpha: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.emeraldGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.lightbulb_rounded, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'DID YOU KNOW?',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                    color: AppTheme.forestGreen,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  species.interestingFact,
                  style: const TextStyle(
                    fontSize: 13.5,
                    height: 1.45,
                    color: AppTheme.textDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThreatItem(String threat) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.dividerColor),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.close_rounded,
              color: AppTheme.statusCriticallyEndangered,
              size: 18,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                threat,
                style: const TextStyle(
                  fontSize: 13.5,
                  color: AppTheme.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpItem(String action) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.dividerColor),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: AppTheme.emeraldGreen,
              size: 18,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                action,
                style: const TextStyle(
                  fontSize: 13.5,
                  color: AppTheme.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the Wikimedia Commons dynamic photograph section.
  Widget _buildWikimediaSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.paleSage,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.photo_library_rounded,
                  color: AppTheme.forestGreen,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wikimedia Commons Live Photography',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark,
                      ),
                    ),
                    Text(
                      'Retrieved dynamically via official Commons API',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppTheme.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          if (_isLoadingCommons)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(strokeWidth: 2.5, color: AppTheme.forestGreen),
                    SizedBox(height: 10),
                    Text(
                      'Discovering photographs from Wikimedia Commons...',
                      style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
                    ),
                  ],
                ),
              ),
            )
          else if (_commonsError != null || _commonsImages.isEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.warmOffWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.wifi_off_rounded, color: AppTheme.textLight, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _commonsError ??
                          'No supplementary Wikimedia Commons photos retrieved. Bundled offline photography is active.',
                      style: const TextStyle(fontSize: 12, color: AppTheme.textMuted),
                    ),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: _commonsImages.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final img = _commonsImages[index];
                  return GestureDetector(
                    onTap: () => _showImageAttributionDialog(img),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 130,
                            height: 130,
                            child: Image.network(
                              img.thumbUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: AppTheme.paleSage,
                                child: const Icon(Icons.broken_image_rounded, color: AppTheme.forestGreen),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                              color: Colors.black.withValues(alpha: 0.65),
                              child: Text(
                                img.license,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  /// Displays photograph metadata and license attribution in a detailed dialog.
  void _showImageAttributionDialog(WikimediaImage img) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Row(
          children: [
            Icon(Icons.camera_alt_rounded, color: AppTheme.forestGreen, size: 22),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Wikimedia Commons Media',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  img.thumbUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, err, stack) => const Icon(Icons.broken_image_rounded),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                img.cleanTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 8),
              _buildMetaRow('Photographer / Artist', img.author),
              const SizedBox(height: 4),
              _buildMetaRow('License', img.license),
              if (img.description.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  img.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: AppTheme.textMuted),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close', style: TextStyle(color: AppTheme.forestGreen, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  Widget _buildMetaRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 125,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.textMuted,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
          ),
        ),
      ],
    );
  }
}
