# WildGuard — Endangered Species Gallery 🌿🐾

> **"Discover. Protect. Preserve."**  
> An interactive wildlife conservation Flutter application aligned with **UN Sustainable Development Goal 15: Life on Land**.

---

## 📌 Project Overview

**WildGuard** is a production-grade wildlife conservation gallery application developed with Flutter and Dart. The app showcases 53 authentic threatened and endangered species across terrestrial, freshwater, and marine biospheres, detailing their native habitats, geographic distributions, dietary classifications, survival threats, ecological roles, and actionable citizen protection measures.

### 🎯 Primary Flutter Widgets Demonstrated
1. **`GridView.builder` & `SliverGrid`**: Responsive multi-column layout (adapting dynamically across mobile, tablet, and desktop) providing high-performance, memory-efficient lazy instantiation of wildlife cards.
2. **`Image` (`Image.asset` / `Image.network`)**: Bundled high-resolution offline photography with seamless dynamic integration of the official **Wikimedia Commons API**, complete with progressive loading and graceful offline fallbacks.
3. **`Text`**: Hierarchical Material 3 typography featuring bold common names, italicized binomial scientific names, population counters, and rich educational descriptions.
4. **`TextField`**: Real-time debounce-ready search querying common names, scientific binomials, taxonomic categories, habitats, and geographic regions.
5. **`ChoiceChip`**: Interactive taxonomic filtering chips (*All, Mammals, Birds, Reptiles, Amphibians, Marine Life, Freshwater*).

---

## 🌍 UN SDG 15 — Life on Land Alignment

### Official SDG 15 Alignment Justification:
> *"WildGuard supports SDG 15 by educating users about threatened wildlife, biodiversity, habitat loss, and conservation. By presenting species information and practical protection measures, the app encourages awareness and responsible action to protect terrestrial ecosystems and prevent biodiversity loss."*

### Holistic Biodiversity Note:
While the app's primary mission reinforces terrestrial habitat preservation under SDG 15, the gallery deliberately incorporates prominent freshwater and marine species (such as the **Blue Whale**, **Hawksbill Sea Turtle**, and **Yangtze Finless Porpoise**) to emphasize that Earth's terrestrial, riparian, and oceanic ecosystems are ecologically interconnected.

---

## 📱 Application Screens & Architecture

### 1. Home Screen — Species Gallery (`screens/gallery_screen.dart`)
- **Branded AppBar**: WildGuard leaf-and-shield logo, title, and official tagline.
- **Featured Spotlight Carousel**: Top horizontal carousel showcasing high-risk endangered species.
- **Real-Time Search Bar**: Interactive query filtering with instant clear button.
- **Taxonomic Category Filter**: Horizontal category selector covering 6 taxonomic groups.
- **Responsive Gallery Grid**: Powered by `SliverGrid` with `SpeciesCard` items.
- **Wikimedia Commons Explorer**: Modal sheet allowing users to query millions of wildlife photographs via the official Commons API.
- **Empty State**: Friendly graphic and "Reset All Filters" action when queries yield no results.

### 2. Species Detail Screen (`screens/species_detail_screen.dart`)
- **Hero Photography Header**: Full-bleed photograph with dark contrast gradient and category tag.
- **IUCN Status Card**: Standardized color-coded status badge with official Red List definition.
- **Quick Metrics**: Population in the wild, geographic distribution, native habitat, and diet.
- **Ecosystem Role & Overview**: Scientific explanation of the animal's ecological niche.
- **"Did You Know?" Fact Box**: Memorable trivia callout box.
- **Critical Survival Threats**: Threat list with distinct warning indicators.
- **Active Conservation Measures**: What field rangers and researchers are actively doing.
- **"How You Can Help" Section**: Practical actions for everyday citizens.
- **Live Wikimedia Commons Integration**: Dynamic carousel of supplementary photographs fetched from the official API with photographer credits, license types (CC BY-SA), and Commons source links.
- **Interactive Bookmark**: Toggleable bookmark action with instant local persistence and snackbar feedback.

### 3. Favourites Screen (`screens/favorites_screen.dart`)
- **Local Persistence**: Powered by `SharedPreferences` without requiring an account.
- **Reactive Synchronization**: Real-time updates when toggling bookmarks from the gallery or detail screen.
- **Empty State**: Helpful callout encouraging users to explore the gallery when no items are bookmarked.

### 4. Conservation Screen (`screens/conservation_screen.dart`)
- **Dedicated SDG 15 Card**: Official heading and quoted justification.
- **Ecosystem Balance & Trophic Cascades**: Why biodiversity directly sustains human survival.
- **Top 5 Survival Threats**: Habitat destruction, poaching, climate change, pollution, invasive species.
- **5 Tangible Citizen Actions**: Ethical shopping, e-waste recycling, supporting community reserves, citizen science (iNaturalist/eBird), and environmental literacy.

### 5. About Screen (`screens/about_screen.dart`)
- **Application Identity**: Version, concept summary, and conservation purpose.
- **Conservation Classification Standards**: Deep dive into IUCN Red List status tiers (CR, EN, VU).
- **Data & Asset Attributions**: IUCN Red List, WWF factsheets, and Wikimedia Commons.
- **Disclaimer**: Scientific references and licensing compliance notes.

---

## 📂 Project Directory Structure

```text
wildguard/
├── assets/
│   └── images/                     # Bundled high-res wildlife photos (100% offline)
│       ├── tiger.jpg
│       ├── asian_elephant.jpg
│       ├── amur_leopard.jpg
│       ├── sumatran_orangutan.jpg
│       ├── javan_rhino.jpg
│       ├── black_rhino.jpg
│       ├── hawksbill_turtle.jpg
│       ├── blue_whale.jpg
│       ├── red_panda.jpg
│       ├── african_wild_dog.jpg
│       ├── philippine_eagle.jpg
│       ├── mountain_gorilla.jpg
│       ├── galapagos_tortoise.jpg
│       ├── snowy_owl.jpg
│       ├── app_logo.png            # Custom 512x512 WildGuard logo
│       └── placeholder.jpg
├── lib/
│   ├── main.dart                   # Application entry point
│   ├── app.dart                    # MaterialApp & light theme declaration
│   ├── models/
│   │   ├── species.dart            # Species data model & ConservationStatus enum
│   │   └── wikimedia_image.dart    # Wikimedia Commons API image metadata model
│   ├── services/
│   │   ├── favorites_service.dart  # SharedPreferences local favorites persistence
│   │   └── wikimedia_service.dart  # Official Wikimedia Commons search API service
│   ├── data/
│   │   └── species_data.dart       # 53 authentic species with IUCN Red List data
│   ├── theme/
│   │   └── app_theme.dart          # Nature-inspired Material 3 colors & styles
│   ├── widgets/
│   │   ├── species_card.dart       # Reusable Grid card (Image + Text widgets)
│   │   ├── search_bar_widget.dart  # TextField search with clear button
│   │   ├── category_filter.dart    # Horizontal ChoiceChips filter
│   │   └── conservation_status_badge.dart # IUCN Red List color-coded badge
│   └── screens/
│       ├── main_navigation_screen.dart # Root scaffold with NavigationBar (4 tabs)
│       ├── gallery_screen.dart     # GridView species gallery with spotlight
│       ├── favorites_screen.dart   # Bookmarked species watchlist
│       ├── species_detail_screen.dart # Comprehensive species details & Commons photos
│       ├── conservation_screen.dart   # SDG 15 & global threats guide
│       └── about_screen.dart       # Mission, standards, and references
└── test/
    └── widget_test.dart            # Comprehensive unit and widget tests
```

---

## 🐾 Species Dataset Summary (53 Species)

The application includes 53 authentic, non-duplicated species spanning 6 taxonomic categories:
- **Mammals (18)**: Bengal Tiger, Asian Elephant, Amur Leopard, Sumatran Orangutan, Bornean Orangutan, Javan Rhinoceros, Black Rhinoceros, Red Panda, African Wild Dog, Mountain Gorilla, Sumatran Tiger, Saola, Snow Leopard, Giant Panda, Sunda Pangolin, Iberian Lynx, Cheetah, Koala.
- **Birds (9)**: Philippine Eagle, Snowy Owl, California Condor, Kakapo, Whooping Crane, Spix's Macaw, Harpy Eagle, Northern Bald Ibis, Kiwi (North Island Brown).
- **Reptiles (7)**: Galápagos Giant Tortoise, Komodo Dragon, Gharial, Radiated Tortoise, Chinese Alligator, Ploughshare Tortoise, Orinoco Crocodile.
- **Amphibians (6)**: Axolotl, Golden Poison Frog, Panamanian Golden Frog, Hellbender, Mountain Chicken Frog, Olm.
- **Marine Life (7)**: Blue Whale, Hawksbill Sea Turtle, Vaquita, Whale Shark, Leatherback Sea Turtle, Dugong, North Atlantic Right Whale.
- **Freshwater (6)**: Yangtze Finless Porpoise, Mekong Giant Catfish, Beluga Sturgeon, Giant Freshwater Stingray, European Eel, Arapaima.

---

## 🛠️ Testing & Build Instructions

```bash
# Get dependencies
flutter pub get

# Run static analysis
flutter analyze

# Run unit & widget test suite
flutter test

# Build Android Release APK
flutter build apk --release

# Build Web Release
flutter build web --release
```
