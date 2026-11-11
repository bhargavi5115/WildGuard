import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/species.dart';

/// Service managing locally persisted user favourite species using SharedPreferences.
///
/// Implements [ChangeNotifier] to ensure reactive UI synchronization across
/// the Gallery, Detail, and dedicated Favourites screens without needing an account.
class FavoritesService extends ChangeNotifier {
  static const String _storageKey = 'wildguard_favorites_v1';

  final Set<String> _favoriteIds = {};
  bool _isInitialized = false;

  FavoritesService();

  /// Read-only snapshot of current favourite species IDs.
  Set<String> get favoriteIds => Set.unmodifiable(_favoriteIds);

  /// Whether the service has completed loading persisted state.
  bool get isInitialized => _isInitialized;

  /// Number of currently saved favourites.
  int get count => _favoriteIds.length;

  /// Initializes the service by reading stored favourite IDs from SharedPreferences.
  Future<void> init() async {
    if (_isInitialized) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedList = prefs.getStringList(_storageKey);
      if (savedList != null) {
        _favoriteIds.addAll(savedList);
      }
    } catch (e) {
      debugPrint('FavoritesService init error: $e');
    } finally {
      _isInitialized = true;
      notifyListeners();
    }
  }

  /// Checks if a species is currently in the user's favourites list.
  bool isFavorite(String speciesId) {
    return _favoriteIds.contains(speciesId);
  }

  /// Toggles a species favourite status and persists the updated list.
  Future<bool> toggleFavorite(String speciesId) async {
    final bool willBeFavorite = !_favoriteIds.contains(speciesId);
    if (willBeFavorite) {
      _favoriteIds.add(speciesId);
    } else {
      _favoriteIds.remove(speciesId);
    }
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_storageKey, _favoriteIds.toList());
    } catch (e) {
      debugPrint('Failed to persist favourite: $e');
    }

    return willBeFavorite;
  }

  /// Helper to filter a full species list down to only bookmarked favourites.
  List<Species> filterFavoriteSpecies(List<Species> allSpecies) {
    return allSpecies.where((s) => _favoriteIds.contains(s.id)).toList();
  }

  /// Clears all favorites (for user data reset).
  Future<void> clearAll() async {
    _favoriteIds.clear();
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_storageKey);
    } catch (e) {
      debugPrint('Failed to clear favourites: $e');
    }
  }
}
