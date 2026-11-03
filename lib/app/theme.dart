import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppColors {
  static const accent = Color(0xFFEECE1A);
  static const background = Color(0xFF0E0E10);
  static const surface = Color(0xFF17171A);
  static const surfaceHigh = Color(0xFF202024);
  static const border = Color(0xFF2C2C31);
  static const textPrimary = Color(0xFFF4F4F5);
  static const textMuted = Color(0xFFA1A1AA);
}

abstract final class AppTheme {
  static ThemeData dark() {
    final base = ThemeData(useMaterial3: true, brightness: Brightness.dark);

    final body = GoogleFonts.interTextTheme(base.textTheme);
    final textTheme = body
        .copyWith(
          displayLarge: GoogleFonts.outfit(textStyle: body.displayLarge, fontWeight: FontWeight.w700),
          displayMedium: GoogleFonts.outfit(textStyle: body.displayMedium, fontWeight: FontWeight.w700),
          displaySmall: GoogleFonts.outfit(textStyle: body.displaySmall, fontWeight: FontWeight.w700),
          headlineLarge: GoogleFonts.outfit(textStyle: body.headlineLarge, fontWeight: FontWeight.w600),
          headlineMedium: GoogleFonts.outfit(textStyle: body.headlineMedium, fontWeight: FontWeight.w600),
          headlineSmall: GoogleFonts.outfit(textStyle: body.headlineSmall, fontWeight: FontWeight.w600),
          titleLarge: GoogleFonts.outfit(textStyle: body.titleLarge, fontWeight: FontWeight.w600),
        )
        .apply(bodyColor: AppColors.textPrimary, displayColor: AppColors.textPrimary);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        onPrimary: Colors.black,
        secondary: AppColors.accent,
        onSecondary: Colors.black,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        outline: AppColors.border,
      ),
      textTheme: textTheme,
      dividerTheme: const DividerThemeData(color: AppColors.border, thickness: 1),
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all(6),
        radius: const Radius.circular(10),
        thumbColor: WidgetStateProperty.all(AppColors.border),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.border),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 15),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceHigh,
        side: const BorderSide(color: AppColors.border),
        labelStyle: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    );
  }
}
