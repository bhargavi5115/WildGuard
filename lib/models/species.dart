import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// IUCN Red List conservation status categories for threatened wildlife.
enum ConservationStatus {
  criticallyEndangered,
  endangered,
  vulnerable;

  /// Official 2-letter IUCN Red List abbreviation.
  String get code {
    switch (this) {
      case ConservationStatus.criticallyEndangered:
        return 'CR';
      case ConservationStatus.endangered:
        return 'EN';
      case ConservationStatus.vulnerable:
        return 'VU';
    }
  }

  /// Full human-readable display name.
  String get displayName {
    switch (this) {
      case ConservationStatus.criticallyEndangered:
        return 'Critically Endangered';
      case ConservationStatus.endangered:
        return 'Endangered';
      case ConservationStatus.vulnerable:
        return 'Vulnerable';
    }
  }

  /// Primary color associated with this conservation category.
  Color get color {
    switch (this) {
      case ConservationStatus.criticallyEndangered:
        return AppTheme.statusCriticallyEndangered;
      case ConservationStatus.endangered:
        return AppTheme.statusEndangered;
      case ConservationStatus.vulnerable:
        return AppTheme.statusVulnerable;
    }
  }

  /// Light tint background color for badges and chips.
  Color get backgroundColor {
    switch (this) {
      case ConservationStatus.criticallyEndangered:
        return AppTheme.statusCriticallyEndangeredBg;
      case ConservationStatus.endangered:
        return AppTheme.statusEndangeredBg;
      case ConservationStatus.vulnerable:
        return AppTheme.statusVulnerableBg;
    }
  }

  /// Concise explanation of this IUCN Red List classification.
  String get definition {
    switch (this) {
      case ConservationStatus.criticallyEndangered:
        return 'Facing an extremely high risk of extinction in the wild in the immediate future.';
      case ConservationStatus.endangered:
        return 'Facing a very high risk of extinction in the wild in the near future.';
      case ConservationStatus.vulnerable:
        return 'Facing a high risk of endangerment in the wild over the medium term.';
    }
  }
}

/// Represents an individual wildlife species in the WildGuard gallery.
class Species {
  final String id;
  final String commonName;
  final String scientificName;
  final String category; // 'Mammals', 'Birds', 'Reptiles', 'Amphibians', 'Marine Life', 'Freshwater'
  final ConservationStatus conservationStatus;
  final String habitat; // Native habitat type
  final String geographicDistribution; // Countries or regions where it occurs
  final String diet; // Dietary classification & food sources
  final String populationEstimate; // Official population estimate
  final String description; // Factual overview / short description
  final String interestingFact; // Did-you-know fact
  final List<String> threats; // Primary survival threats
  final String conservationAction; // Current conservation initiatives
  final List<String> howYouCanHelp; // Practical actions for citizens
  final String imageAssetPath; // Bundled local asset path or fallback
  final String? imageUrl; // High-resolution web/Commons thumbnail URL
  final String imageAttribution; // Photographer and license attribution
  final String sourceReference; // Source reference for factual information

  const Species({
    required this.id,
    required this.commonName,
    required this.scientificName,
    required this.category,
    required this.conservationStatus,
    required this.habitat,
    required this.geographicDistribution,
    required this.diet,
    required this.populationEstimate,
    required this.description,
    required this.interestingFact,
    required this.threats,
    required this.conservationAction,
    required this.howYouCanHelp,
    required this.imageAssetPath,
    this.imageUrl,
    required this.imageAttribution,
    this.sourceReference = 'IUCN Red List of Threatened Species / WWF',
  });

  /// Helper to check if this species matches a specific category filter.
  /// Strictly compares the defined category without loose or cross-category leakage.
  bool matchesCategory(String selectedCategory) {
    if (selectedCategory == 'All') return true;
    return category.trim().toLowerCase() == selectedCategory.trim().toLowerCase();
  }

  /// Helper to check if this species matches a search query by common name,
  /// scientific name, category, habitat, or geographic distribution.
  bool matchesSearchQuery(String query) {
    if (query.trim().isEmpty) return true;
    final lower = query.trim().toLowerCase();
    return commonName.toLowerCase().contains(lower) ||
        scientificName.toLowerCase().contains(lower) ||
        category.toLowerCase().contains(lower) ||
        habitat.toLowerCase().contains(lower) ||
        geographicDistribution.toLowerCase().contains(lower) ||
        diet.toLowerCase().contains(lower);
  }
}
