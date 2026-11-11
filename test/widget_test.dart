import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wildguard/app.dart';
import 'package:wildguard/data/species_data.dart';
import 'package:wildguard/models/species.dart';
import 'package:wildguard/services/favorites_service.dart';
import 'package:wildguard/widgets/species_card.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('Species Model & Dataset Regression Tests', () {
    test('Dataset contains at least 50 authentic species without duplicates', () {
      expect(SpeciesData.allSpecies.length, greaterThanOrEqualTo(50));
      final ids = SpeciesData.allSpecies.map((s) => s.id).toSet();
      expect(ids.length, equals(SpeciesData.allSpecies.length),
          reason: 'Every species must have a unique ID');
    });

    test('Every species has complete factual attributes', () {
      const allowedCategories = {
        'Mammals',
        'Birds',
        'Reptiles',
        'Amphibians',
        'Marine Life',
        'Freshwater',
      };

      for (final species in SpeciesData.allSpecies) {
        expect(species.id.trim(), isNotEmpty);
        expect(species.commonName.trim(), isNotEmpty);
        expect(species.scientificName.trim(), isNotEmpty);
        expect(species.category.trim(), isNotEmpty);
        expect(allowedCategories.contains(species.category), isTrue,
            reason: '${species.commonName} has unrecognized category: ${species.category}');
        expect(species.habitat.trim(), isNotEmpty);
        expect(species.geographicDistribution.trim(), isNotEmpty);
        expect(species.diet.trim(), isNotEmpty);
        expect(species.populationEstimate.trim(), isNotEmpty);
        expect(species.description.trim(), isNotEmpty);
        expect(species.interestingFact.trim(), isNotEmpty);
        expect(species.threats, isNotEmpty);
        expect(species.conservationAction.trim(), isNotEmpty);
        expect(species.howYouCanHelp, isNotEmpty);
        expect(species.imageAssetPath.trim(), isNotEmpty);
        expect(species.imageAssetPath.startsWith('assets/images/'), isTrue);
        expect(species.imageAttribution.trim(), isNotEmpty);
        expect(species.sourceReference.trim(), isNotEmpty);
      }
    });

    test('Specific verified species-to-image mappings for bundled assets are preserved', () {
      final mapping = {
        'red_panda': 'assets/images/red_panda.jpg',
        'african_wild_dog': 'assets/images/african_wild_dog.jpg',
        'philippine_eagle': 'assets/images/philippine_eagle.jpg',
        'mountain_gorilla': 'assets/images/mountain_gorilla.jpg',
        'bengal_tiger': 'assets/images/tiger.jpg',
        'asian_elephant': 'assets/images/asian_elephant.jpg',
        'amur_leopard': 'assets/images/amur_leopard.jpg',
        'sumatran_orangutan': 'assets/images/sumatran_orangutan.jpg',
        'javan_rhino': 'assets/images/javan_rhino.jpg',
        'black_rhino': 'assets/images/black_rhino.jpg',
        'hawksbill_turtle': 'assets/images/hawksbill_turtle.jpg',
        'blue_whale': 'assets/images/blue_whale.jpg',
        'galapagos_tortoise': 'assets/images/galapagos_tortoise.jpg',
        'snowy_owl': 'assets/images/snowy_owl_photo.jpg',
      };

      for (final entry in mapping.entries) {
        final species = SpeciesData.allSpecies.firstWhere(
          (s) => s.id == entry.key,
          orElse: () => throw Exception('Species not found: ${entry.key}'),
        );
        expect(species.imageAssetPath, equals(entry.value),
            reason: '${species.commonName} image path mismatch');
      }
    });

    test('Every species has a valid remote image URL as network fallback', () {
      for (final species in SpeciesData.allSpecies) {
        expect(
          species.imageUrl != null && species.imageUrl!.isNotEmpty,
          isTrue,
          reason:
              '${species.commonName} (${species.id}) must have a valid imageUrl for network fallback',
        );
        expect(
          species.imageUrl!.startsWith('https://'),
          isTrue,
          reason:
              '${species.commonName} imageUrl must use HTTPS: ${species.imageUrl}',
        );
      }
    });

    test('No duplicate image URLs assigned to different species', () {
      final urlMap = <String, String>{};
      for (final species in SpeciesData.allSpecies) {
        if (species.imageUrl != null && species.imageUrl!.isNotEmpty) {
          final url = species.imageUrl!;
          if (urlMap.containsKey(url)) {
            fail(
              'Duplicate imageUrl found: "${species.commonName}" and "${urlMap[url]}" share the same URL: $url',
            );
          }
          urlMap[url] = species.commonName;
        }
      }
    });

    test('No duplicate asset paths assigned to different species (excluding placeholder)', () {
      final assetMap = <String, String>{};
      for (final species in SpeciesData.allSpecies) {
        final path = species.imageAssetPath;
        if (path == 'assets/images/placeholder.jpg') continue;
        if (assetMap.containsKey(path)) {
          fail(
            'Duplicate imageAssetPath found: "${species.commonName}" and "${assetMap[path]}" share: $path',
          );
        }
        assetMap[path] = species.commonName;
      }
    });

    test('All 8 user-provided local photograph assets are correctly mapped', () {
      final photoMappings = {
        'sumatran_tiger': 'assets/images/sumatran_tiger.jpg',
        'giant_panda': 'assets/images/giant_panda.jpg',
        'snowy_owl': 'assets/images/snowy_owl_photo.jpg',
        'north_island_brown_kiwi': 'assets/images/north_island_brown_kiwi.jpg',
        'axolotl': 'assets/images/axolotl.jpg',
        'hellbender': 'assets/images/eastern_hellbender.jpg',
        'olm': 'assets/images/olm.jpg',
        'yangtze_finless_porpoise': 'assets/images/yangtze_finless_porpoise.jpg',
      };

      for (final entry in photoMappings.entries) {
        final species = SpeciesData.allSpecies.firstWhere(
          (s) => s.id == entry.key,
          orElse: () => throw Exception('Species not found: ${entry.key}'),
        );
        expect(species.imageAssetPath, equals(entry.value),
            reason: '${species.commonName} should use local photograph asset');
        expect(species.imageAssetPath, isNot(equals('assets/images/placeholder.jpg')),
            reason: '${species.commonName} must NOT use the generic placeholder');
      }
    });

    test('Snowy Owl imageUrl points to an actual owl photograph, not a scan', () {
      final snowyOwl = SpeciesData.allSpecies.firstWhere(
        (s) => s.id == 'snowy_owl',
      );
      expect(snowyOwl.imageUrl, isNotNull);
      // The old scan URL should be replaced
      expect(
        snowyOwl.imageUrl!.contains('Scan'),
        isFalse,
        reason: 'Snowy Owl imageUrl should not reference a scan/illustration',
      );
      // Should reference the actual Bubo scandiacus photo
      expect(
        snowyOwl.imageUrl!.contains('Bubo_scandiacus') ||
            snowyOwl.imageUrl!.contains('Snowy'),
        isTrue,
        reason: 'Snowy Owl imageUrl should reference a verified snowy owl photo',
      );
    });

    test('All 20 required species examples from specification are present', () {
      final requiredCommonNames = [
        'Amur Leopard',
        'Javan Rhinoceros',
        'Sumatran Orangutan',
        'Bengal Tiger',
        'Asian Elephant',
        'Red Panda',
        'African Wild Dog',
        'Mountain Gorilla',
        'Black Rhinoceros',
        'Philippine Eagle',
        'Hawksbill Sea Turtle',
        'Blue Whale',
        'Vaquita',
        'Sumatran Tiger',
        'Saola',
        'Bornean Orangutan',
        'Axolotl',
        'California Condor',
        'Whale Shark',
        'Yangtze Finless Porpoise',
      ];

      for (final name in requiredCommonNames) {
        final found = SpeciesData.allSpecies.any(
          (s) => s.commonName.toLowerCase().trim() == name.toLowerCase().trim(),
        );
        expect(found, isTrue, reason: 'Required species "$name" must be present in dataset');
      }
    });

    test('IUCN Red List statuses are correctly distinguished', () {
      final statuses = SpeciesData.allSpecies.map((s) => s.conservationStatus).toSet();
      expect(statuses.contains(ConservationStatus.criticallyEndangered), isTrue);
      expect(statuses.contains(ConservationStatus.endangered), isTrue);
      expect(statuses.contains(ConservationStatus.vulnerable), isTrue);
    });

    test('Category filter strictly isolates taxonomic groups', () {
      final mammals = SpeciesData.allSpecies.where((s) => s.matchesCategory('Mammals')).toList();
      final birds = SpeciesData.allSpecies.where((s) => s.matchesCategory('Birds')).toList();
      final reptiles = SpeciesData.allSpecies.where((s) => s.matchesCategory('Reptiles')).toList();
      final amphibians = SpeciesData.allSpecies.where((s) => s.matchesCategory('Amphibians')).toList();
      final marine = SpeciesData.allSpecies.where((s) => s.matchesCategory('Marine Life')).toList();
      final freshwater = SpeciesData.allSpecies.where((s) => s.matchesCategory('Freshwater')).toList();
      final all = SpeciesData.allSpecies.where((s) => s.matchesCategory('All')).toList();

      expect(mammals.isNotEmpty, isTrue);
      expect(birds.isNotEmpty, isTrue);
      expect(reptiles.isNotEmpty, isTrue);
      expect(amphibians.isNotEmpty, isTrue);
      expect(marine.isNotEmpty, isTrue);
      expect(freshwater.isNotEmpty, isTrue);
      expect(all.length, equals(SpeciesData.allSpecies.length));

      for (final s in mammals) {
        expect(s.category, equals('Mammals'));
      }
      for (final s in birds) {
        expect(s.category, equals('Birds'));
      }
      for (final s in reptiles) {
        expect(s.category, equals('Reptiles'));
      }
      for (final s in amphibians) {
        expect(s.category, equals('Amphibians'));
      }
      for (final s in marine) {
        expect(s.category, equals('Marine Life'));
      }
      for (final s in freshwater) {
        expect(s.category, equals('Freshwater'));
      }
    });

    test('Search filtering matches common name, scientific name, and habitat keywords', () {
      final tiger = SpeciesData.allSpecies.firstWhere((s) => s.id == 'bengal_tiger');
      expect(tiger.matchesSearchQuery('Bengal'), isTrue);
      expect(tiger.matchesSearchQuery('Panthera'), isTrue);
      expect(tiger.matchesSearchQuery('tiger'), isTrue);
      expect(tiger.matchesSearchQuery('nonexistentwildanimal'), isFalse);
    });
  });

  group('FavoritesService Unit Tests', () {
    test('Can toggle and persist favourites in local storage', () async {
      final service = FavoritesService();
      await service.init();

      expect(service.isFavorite('bengal_tiger'), isFalse);

      final added = await service.toggleFavorite('bengal_tiger');
      expect(added, isTrue);
      expect(service.isFavorite('bengal_tiger'), isTrue);
      expect(service.count, equals(1));

      final filtered = service.filterFavoriteSpecies(SpeciesData.allSpecies);
      expect(filtered.length, equals(1));
      expect(filtered.first.id, equals('bengal_tiger'));

      final removed = await service.toggleFavorite('bengal_tiger');
      expect(removed, isFalse);
      expect(service.isFavorite('bengal_tiger'), isFalse);
      expect(service.count, equals(0));
    });
  });

  group('WildGuard Widget & UI Tests', () {
    testWidgets('Gallery screen renders branding, heading, and species cards', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const WildGuardApp());
      await tester.pumpAndSettle();

      // Verify App Bar & Branding
      expect(find.text('WildGuard'), findsWidgets);
      expect(find.text('Discover • Protect • Preserve'), findsWidgets);

      // Verify Welcome Heading & Subtitle
      expect(find.text('Explore Our Precious Wildlife'), findsOneWidget);

      // Verify Featured Conservation Banner
      expect(find.text('SDG 15: Life on Land'), findsOneWidget);
      expect(find.text('Protecting Earth\'s Biodiversity'), findsOneWidget);

      // Verify Search TextField
      expect(find.byType(TextField), findsOneWidget);

      // Verify Category Chips
      expect(find.widgetWithText(ChoiceChip, 'All'), findsOneWidget);
      expect(find.widgetWithText(ChoiceChip, 'Mammals'), findsOneWidget);
      expect(find.widgetWithText(ChoiceChip, 'Birds'), findsOneWidget);
      expect(find.widgetWithText(ChoiceChip, 'Reptiles'), findsOneWidget);
      expect(find.widgetWithText(ChoiceChip, 'Amphibians'), findsOneWidget);
      expect(find.widgetWithText(ChoiceChip, 'Marine Life'), findsOneWidget);
      expect(find.widgetWithText(ChoiceChip, 'Freshwater'), findsOneWidget);

      // Verify Species Cards rendered via GridView
      expect(find.byType(SpeciesCard), findsWidgets);
      expect(find.text('Bengal Tiger'), findsWidgets);
      expect(find.text('Asian Elephant'), findsWidgets);
    });

    testWidgets('Search and category filters work together correctly', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const WildGuardApp());
      await tester.pumpAndSettle();

      // Filter by Birds
      final birdsChip = find.widgetWithText(ChoiceChip, 'Birds');
      await tester.tap(birdsChip);
      await tester.pumpAndSettle();

      // In Birds: Philippine Eagle and Snowy Owl should be present, Bengal Tiger should not
      expect(find.text('Philippine Eagle'), findsOneWidget);
      expect(find.text('Bengal Tiger'), findsNothing);

      // Search for "Eagle" under Birds
      final searchField = find.byType(TextField);
      await tester.enterText(searchField, 'Eagle');
      await tester.pumpAndSettle();

      expect(find.text('Philippine Eagle'), findsWidgets);
      expect(find.text('Snowy Owl'), findsNothing);

      // Clear search
      final clearButton = find.byTooltip('Clear search');
      expect(clearButton, findsOneWidget);
      await tester.tap(clearButton);
      await tester.pumpAndSettle();

      expect(find.text('Philippine Eagle'), findsWidgets);
      expect(find.text('Snowy Owl'), findsWidgets);

      // Switch to Amphibians while searching "Eagle" -> 0 results
      await tester.enterText(searchField, 'Eagle');
      await tester.pumpAndSettle();
      final amphibiansChip = find.widgetWithText(ChoiceChip, 'Amphibians');
      await tester.ensureVisible(amphibiansChip);
      await tester.tap(amphibiansChip);
      await tester.pumpAndSettle();

      expect(find.text('No Species Found'), findsOneWidget);
      expect(find.text('Reset All Filters'), findsOneWidget);

      // Reset filters button restores all species
      await tester.tap(find.text('Reset All Filters'));
      await tester.pumpAndSettle();

      expect(find.text('Bengal Tiger'), findsWidgets);
    });

    testWidgets('Tapping a species card opens SpeciesDetailScreen with matching data', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const WildGuardApp());
      await tester.pumpAndSettle();

      // Tap on Bengal Tiger card
      final tigerCard = find.text('Bengal Tiger').first;
      await tester.tap(tigerCard);
      await tester.pumpAndSettle();

      // Verify Detail Screen content
      expect(find.text('Overview & Ecological Role'), findsOneWidget);
      expect(find.text('DID YOU KNOW?'), findsOneWidget);
      expect(find.text('Critical Threats to Survival'), findsOneWidget);
      expect(find.text('How You Can Help Protect Them'), findsOneWidget);
      expect(find.text('Geographic Distribution'), findsOneWidget);
      expect(find.text('Dietary Classification'), findsOneWidget);

      // Tap back button
      final backButton = find.byTooltip('Back to Gallery');
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      // Returned to Gallery
      expect(find.text('Explore Our Precious Wildlife'), findsOneWidget);
    });

    testWidgets('Bottom navigation switches between Gallery, Favourites, Conservation, and About screens', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const WildGuardApp());
      await tester.pumpAndSettle();

      // Switch to Favourites tab
      final favTab = find.text('Favourites');
      await tester.tap(favTab);
      await tester.pumpAndSettle();

      expect(find.text('Saved Favourites'), findsOneWidget);
      expect(find.text('No Favourites Saved Yet'), findsOneWidget);

      // Switch to Conservation tab
      final conservationTab = find.text('Conservation');
      await tester.tap(conservationTab);
      await tester.pumpAndSettle();

      expect(find.text('Conservation & SDG 15'), findsOneWidget);
      expect(find.text('Aligned with UN Sustainable Development Goal 15: Life on Land'), findsOneWidget);
      expect(find.text('Primary Threats to Global Wildlife'), findsOneWidget);

      // Switch to About tab
      final aboutTab = find.text('About');
      await tester.tap(aboutTab);
      await tester.pumpAndSettle();

      expect(find.text('About WildGuard'), findsOneWidget);
      expect(find.text('Conservation Mission'), findsOneWidget);
      expect(find.text('Conservation Classification Standards'), findsOneWidget);

      // Verify that student assignment details are completely absent
      expect(find.text('Student Assignment Details'), findsNothing);
      expect(find.text('[Enter Your Name]'), findsNothing);
      expect(find.text('[Enter Your Roll Number]'), findsNothing);
      expect(find.text('Student Practical Credit Section'), findsNothing);
    });
  });
}
