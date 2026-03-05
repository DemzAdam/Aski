import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AskyColors {
  static const Color bg = Color(0xFFF5F2EE);
  static const Color dark = Color(0xFF1C1A17);
  static const Color accent = Color(0xFFC4714A);
  static const Color muted = Color(0xFF9E9589);
  static const Color subtle = Color(0xFFE8E3DC);
  static const Color text = Color(0xFF2D2A26);
  static const Color green = Color(0xFF4CAF7D);
  static const Color orange = Color(0xFFE8893A);
  static const Color danger = Color(0xFFE05252);
  static const Color white = Color(0xFFFFFFFF);
}

class AskyTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: AskyColors.bg,
        colorScheme: const ColorScheme.light(
          primary: AskyColors.accent,
          secondary: AskyColors.dark,
          surface: AskyColors.white,
        ),
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(  // fix typo
  displayLarge: GoogleFonts.playfairDisplay(        // replace clashDisplay
    fontWeight: FontWeight.w700,
    color: AskyColors.dark,
  ),
  displayMedium: GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w600,
    color: AskyColors.dark,
  ),
  titleLarge: GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w600,
    color: AskyColors.dark,
    fontSize: 22,
  ),
  titleMedium: GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w600,
    color: AskyColors.dark,
    fontSize: 18,
  ),
),
        useMaterial3: true,
      );

  static TextStyle get displayStyle => GoogleFonts.nunito(
        fontWeight: FontWeight.w700,
        color: AskyColors.dark,
        fontSize: 28,
      );

  static TextStyle get headingStyle => GoogleFonts.nunito(
        fontWeight: FontWeight.w600,
        color: AskyColors.dark,
        fontSize: 22,
      );

  static TextStyle get subheadingStyle => GoogleFonts.nunito(
        fontWeight: FontWeight.w600,
        color: AskyColors.dark,
        fontSize: 18,
      );

  static TextStyle get bodyStyle => GoogleFonts.nunito(
        fontWeight: FontWeight.w400,
        color: AskyColors.text,
        fontSize: 14,
      );

  static TextStyle get mutedStyle => GoogleFonts.nunito(
        fontWeight: FontWeight.w400,
        color: AskyColors.muted,
        fontSize: 13,
      );

  static TextStyle get labelStyle => GoogleFonts.nunito(
        fontWeight: FontWeight.w600,
        color: AskyColors.dark,
        fontSize: 12,
      );

  static BoxDecoration get cardDecoration => BoxDecoration(
        color: AskyColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AskyColors.subtle),
        boxShadow: [
          BoxShadow(
            color: AskyColors.dark.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      );
}
