import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wikimedia_image.dart';

/// Service interfacing with the official Wikimedia Commons API to retrieve
/// dynamically discovered wildlife photographs with attribution metadata.
///
/// API Documentation: https://commons.wikimedia.org/wiki/Commons:API
class WikimediaService {
  static const String _apiBaseUrl = 'https://commons.wikimedia.org/w/api.php';
  static const String _userAgent =
      'WildGuard-App/1.0.0 (https://github.com/wildguard; wildlife-conservation@wildguard.org)';

  final http.Client _client;

  // In-memory cache to prevent redundant network requests
  final Map<String, List<WikimediaImage>> _cache = {};

  WikimediaService({http.Client? client}) : _client = client ?? http.Client();

  /// Searches Wikimedia Commons for wildlife photographs matching the given query.
  ///
  /// Uses the official `generator=search` API targeting the File namespace (`gsrnamespace=6`).
  /// Gracefully catches network errors, timeouts, and malformed responses to ensure offline stability.
  Future<List<WikimediaImage>> searchImages(
    String query, {
    int limit = 8,
    int thumbnailWidth = 640,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return const [];

    final cacheKey = '${trimmed.toLowerCase()}_$limit';
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    }

    try {
      final uri = Uri.parse(_apiBaseUrl).replace(
        queryParameters: {
          'action': 'query',
          'generator': 'search',
          'gsrsearch': trimmed,
          'gsrnamespace': '6', // File namespace
          'gsrlimit': limit.toString(),
          'prop': 'imageinfo',
          'iiprop': 'url|size|extmetadata',
          'iiurlwidth': thumbnailWidth.toString(),
          'format': 'json',
        },
      );

      final response = await _client
          .get(
            uri,
            headers: {'User-Agent': _userAgent},
          )
          .timeout(const Duration(seconds: 8));

      if (response.statusCode != 200) {
        return const [];
      }

      final dynamic decoded = jsonDecode(response.body);
      if (decoded is! Map<String, dynamic>) {
        return const [];
      }

      final queryData = decoded['query'] as Map<String, dynamic>?;
      if (queryData == null) {
        return const [];
      }

      final pages = queryData['pages'] as Map<String, dynamic>?;
      if (pages == null || pages.isEmpty) {
        return const [];
      }

      final List<WikimediaImage> results = [];
      for (final page in pages.values) {
        if (page is Map<String, dynamic>) {
          final image = WikimediaImage.fromCommonsJson(page);
          // Only include valid images with accessible thumbnail or original URL
          if (image.thumbUrl.isNotEmpty || image.originalUrl.isNotEmpty) {
            results.add(image);
          }
        }
      }

      _cache[cacheKey] = results;
      return results;
    } on TimeoutException {
      // Slow connection timeout
      return const [];
    } on http.ClientException {
      // Client/connectivity failure (also covers network-unavailable on all platforms)
      return const [];
    } catch (_) {
      // Safe fallback for any unforeseen decoding error or SocketException
      return const [];
    }
  }

  /// Clears in-memory image cache.
  void clearCache() {
    _cache.clear();
  }

  /// Closes the HTTP client when no longer needed.
  void dispose() {
    _client.close();
  }
}
