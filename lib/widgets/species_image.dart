import 'package:flutter/material.dart';
import '../models/species.dart';
import '../theme/app_theme.dart';

/// A reusable widget that handles species image loading with consistent
/// loading indicators, error fallbacks, and priority logic across the app.
///
/// Image priority:
/// 1. Bundled asset (if a dedicated, verified asset exists for the species).
/// 2. Remote URL from Wikimedia Commons (with loading indicator and timeout).
/// 3. Attractive fallback placeholder with species name and category icon.
class SpeciesImage extends StatelessWidget {
  final Species species;
  final BoxFit fit;
  final double? width;
  final double? height;

  /// If true, uses a compact placeholder (icon only, no text).
  final bool compact;

  /// If true, uses a dark-themed fallback (for featured cards / headers).
  final bool darkFallback;

  const SpeciesImage({
    super.key,
    required this.species,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.compact = false,
    this.darkFallback = false,
  });

  /// Returns true if this species has a dedicated bundled asset image
  /// (i.e., not just the generic placeholder).
  bool get _hasDedicatedAsset =>
      species.imageAssetPath.isNotEmpty &&
      species.imageAssetPath != 'assets/images/placeholder.jpg' &&
      !_isBrokenAsset;

  /// Known broken asset files that should be skipped in favor of remote URLs.
  bool get _isBrokenAsset => _brokenAssets.contains(species.imageAssetPath);

  /// The old snowy_owl.jpg contained an unrelated landscape; now replaced by
  /// snowy_owl_photo.jpg so there are no known-broken assets remaining.
  static const Set<String> _brokenAssets = <String>{};

  @override
  Widget build(BuildContext context) {
    // Priority 1: Verified bundled asset
    if (_hasDedicatedAsset) {
      return Image.asset(
        species.imageAssetPath,
        fit: fit,
        width: width,
        height: height,
        semanticLabel: 'Photograph of ${species.commonName}',
        errorBuilder: (context, error, stackTrace) =>
            _buildNetworkImageOrFallback(),
      );
    }

    // Priority 2: Remote URL or Priority 3: Fallback
    return _buildNetworkImageOrFallback();
  }

  Widget _buildNetworkImageOrFallback() {
    if (species.imageUrl != null && species.imageUrl!.isNotEmpty) {
      return Image.network(
        species.imageUrl!,
        fit: fit,
        width: width,
        height: height,
        semanticLabel: 'Photograph of ${species.commonName}',
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoadingIndicator();
        },
        errorBuilder: (context, error, stackTrace) => _buildFallbackWidget(),
      );
    }

    return _buildFallbackWidget();
  }

  Widget _buildLoadingIndicator() {
    final bgColor = darkFallback
        ? AppTheme.pineGreen
        : AppTheme.paleSage.withValues(alpha: 0.5);
    final indicatorColor =
        darkFallback ? AppTheme.paleSage : AppTheme.forestGreen;

    return Container(
      width: width,
      height: height,
      color: bgColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: compact ? 18 : 22,
              height: compact ? 18 : 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.2,
                color: indicatorColor,
              ),
            ),
            if (!compact) ...[
              const SizedBox(height: 6),
              Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 10,
                  color: darkFallback ? Colors.white60 : AppTheme.textMuted,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFallbackWidget() {
    final bgColor = darkFallback ? AppTheme.pineGreen : AppTheme.paleSage;
    final iconColor = darkFallback
        ? Colors.white54
        : AppTheme.forestGreen.withValues(alpha: 0.6);
    final textColor = darkFallback ? Colors.white70 : AppTheme.forestGreen;

    return Container(
      width: width,
      height: height,
      color: bgColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getCategoryIcon(species.category),
              size: compact ? 28 : 34,
              color: iconColor,
            ),
            if (!compact) ...[
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  species.commonName,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  static IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'birds':
        return Icons.flutter_dash_rounded;
      case 'reptiles':
        return Icons.pest_control_rounded;
      case 'amphibians':
        return Icons.water_drop_rounded;
      case 'marine life':
        return Icons.waves_rounded;
      case 'freshwater':
        return Icons.phishing_rounded;
      case 'mammals':
      default:
        return Icons.pets_rounded;
    }
  }
}
