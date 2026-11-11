import 'package:flutter/material.dart';

/// AppTheme defines the nature-inspired color palette, typography,
/// and Material 3 design tokens for WildGuard.
class AppTheme {
  AppTheme._();

  // Primary Nature Colors
  static const Color forestGreen = Color(0xFF1B4332);
  static const Color pineGreen = Color(0xFF2D6A4F);
  static const Color emeraldGreen = Color(0xFF40916C);
  static const Color sageGreen = Color(0xFF74C69D);
  static const Color paleSage = Color(0xFFD8F3DC);

  // Background & Neutral Colors
  static const Color cream = Color(0xFFFAF7F2);
  static const Color warmOffWhite = Color(0xFFF7F9F6);
  static const Color cardSurface = Colors.white;
  static const Color textDark = Color(0xFF1A2E22);
  static const Color textMuted = Color(0xFF526157);
  static const Color textLight = Color(0xFF8A9A8F);
  static const Color dividerColor = Color(0xFFE2E8E2);

  // Earthy & Gold Accents
  static const Color goldAccent = Color(0xFFE9C46A);
  static const Color deepGold = Color(0xFFC69214);
  static const Color warmSand = Color(0xFFD4A373);
  static const Color terracotta = Color(0xFFE76F51);

  // Conservation Status Colors (IUCN Standards)
  static const Color statusCriticallyEndangered = Color(0xFFD90429);
  static const Color statusCriticallyEndangeredBg = Color(0xFFFFE5E8);

  static const Color statusEndangered = Color(0xFFE85D04);
  static const Color statusEndangeredBg = Color(0xFFFFF0E6);

  static const Color statusVulnerable = Color(0xFFD48B00);
  static const Color statusVulnerableBg = Color(0xFFFEF9C3);

  /// Builds the complete Material 3 Light Theme for WildGuard.
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: forestGreen,
      primary: forestGreen,
      onPrimary: Colors.white,
      primaryContainer: paleSage,
      onPrimaryContainer: forestGreen,
      secondary: emeraldGreen,
      onSecondary: Colors.white,
      secondaryContainer: const Color(0xFFE8F5E9),
      onSecondaryContainer: forestGreen,
      tertiary: goldAccent,
      onTertiary: forestGreen,
      surface: warmOffWhite,
      onSurface: textDark,
      error: terracotta,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: warmOffWhite,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: textDark,
        elevation: 0,
        scrolledUnderElevation: 1.5,
        surfaceTintColor: paleSage,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: textDark,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardSurface,
        elevation: 1,
        shadowColor: forestGreen.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: dividerColor, width: 0.8),
        ),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 3,
        indicatorColor: paleSage,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: forestGreen,
            );
          }
          return const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: textMuted,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: forestGreen, size: 24);
          }
          return const IconThemeData(color: textMuted, size: 24);
        }),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        selectedColor: forestGreen,
        secondarySelectedColor: forestGreen,
        labelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        secondaryLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: dividerColor, width: 1.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: const TextStyle(
          color: textLight,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: dividerColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: dividerColor, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: forestGreen, width: 1.8),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: forestGreen,
        contentTextStyle: const TextStyle(color: Colors.white, fontSize: 13.5),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
