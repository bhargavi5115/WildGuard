/// Model representing an image record retrieved from the official Wikimedia Commons API.
class WikimediaImage {
  final String title;
  final String cleanTitle;
  final String thumbUrl;
  final String originalUrl;
  final String descriptionUrl;
  final String author;
  final String license;
  final String description;

  const WikimediaImage({
    required this.title,
    required this.cleanTitle,
    required this.thumbUrl,
    required this.originalUrl,
    required this.descriptionUrl,
    required this.author,
    required this.license,
    required this.description,
  });

  /// Factory constructor to safely parse official Wikimedia Commons API responses.
  factory WikimediaImage.fromCommonsJson(Map<String, dynamic> pageJson) {
    final title = (pageJson['title'] as String?) ?? 'Wildlife Photograph';

    // Strip "File:" prefix and extension for readable caption
    var clean = title;
    if (clean.toLowerCase().startsWith('file:')) {
      clean = clean.substring(5);
    }
    final lastDot = clean.lastIndexOf('.');
    if (lastDot > 0) {
      clean = clean.substring(0, lastDot);
    }
    clean = clean.replaceAll('_', ' ').trim();

    final imageInfoList = pageJson['imageinfo'] as List<dynamic>?;
    final info = (imageInfoList != null && imageInfoList.isNotEmpty)
        ? imageInfoList.first as Map<String, dynamic>
        : <String, dynamic>{};

    final originalUrl = (info['url'] as String?) ?? '';
    final thumbUrl = (info['thumburl'] as String?) ?? originalUrl;
    final descriptionUrl = (info['descriptionurl'] as String?) ??
        (info['descriptionshorturl'] as String?) ??
        'https://commons.wikimedia.org';

    final extmeta = info['extmetadata'] as Map<String, dynamic>?;

    String author = 'Wikimedia Commons Contributor';
    String license = 'Creative Commons';
    String description = '';

    if (extmeta != null) {
      if (extmeta['Artist'] != null && extmeta['Artist'] is Map) {
        final rawArtist = extmeta['Artist']['value'] as String?;
        if (rawArtist != null && rawArtist.trim().isNotEmpty) {
          author = _stripHtml(rawArtist).trim();
        }
      }
      if (extmeta['LicenseShortName'] != null && extmeta['LicenseShortName'] is Map) {
        final rawLicense = extmeta['LicenseShortName']['value'] as String?;
        if (rawLicense != null && rawLicense.trim().isNotEmpty) {
          license = rawLicense.trim();
        }
      } else if (extmeta['UsageTerms'] != null && extmeta['UsageTerms'] is Map) {
        final rawUsage = extmeta['UsageTerms']['value'] as String?;
        if (rawUsage != null && rawUsage.trim().isNotEmpty) {
          license = rawUsage.trim();
        }
      }
      if (extmeta['ImageDescription'] != null && extmeta['ImageDescription'] is Map) {
        final rawDesc = extmeta['ImageDescription']['value'] as String?;
        if (rawDesc != null && rawDesc.trim().isNotEmpty) {
          description = _stripHtml(rawDesc).trim();
        }
      } else if (extmeta['ObjectName'] != null && extmeta['ObjectName'] is Map) {
        final rawObj = extmeta['ObjectName']['value'] as String?;
        if (rawObj != null && rawObj.trim().isNotEmpty) {
          description = _stripHtml(rawObj).trim();
        }
      }
    }

    return WikimediaImage(
      title: title,
      cleanTitle: clean.isNotEmpty ? clean : 'Wildlife Photograph',
      thumbUrl: thumbUrl,
      originalUrl: originalUrl,
      descriptionUrl: descriptionUrl,
      author: author.isNotEmpty ? author : 'Wikimedia Commons Contributor',
      license: license,
      description: description,
    );
  }

  /// Helper to strip basic HTML markup often returned in Wikimedia metadata.
  static String _stripHtml(String htmlString) {
    return htmlString
        .replaceAll(RegExp(r'<[^>]*>'), ' ')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}
