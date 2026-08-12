import 'package:flutter/material.dart';
import 'color_manger.dart';

@immutable
class GlassTheme extends ThemeExtension<GlassTheme> {
  final Color hintText;
  final Color textPrimary;
  final Color colorIcons;
  final Color textMuted;
  final Color background;
  final Color primaryBlue;
  final Color doctorBackGround;
  final Color shadow;
  final List<Color> nearbyColor;
  final List<Color> surfaceGradient;
  final List<Color> borderColors;

  const GlassTheme({
    required this.hintText,
    required this.textPrimary,
    required this.textMuted,
    required this.background,
    required this.nearbyColor,
    required this.surfaceGradient,
    required this.borderColors,
    required this.doctorBackGround,
    required this.shadow,
    required this.colorIcons,
    required this.primaryBlue,
  });

  // ---- Dark ----
  static const dark = GlassTheme(
    shadow: AppColors.shadow,
    hintText: AppColor.grey,
    textPrimary: AppColor.white,
    textMuted: AppColor.primary,
    background: AppColors.white,
    primaryBlue: AppColors.primaryBlue,

    nearbyColor: [AppColors.lightBlue, AppColors.darkBlue],

    surfaceGradient: [GridColor.white800, GridColor.white900],

    borderColors: [AppColor.white, GridColor.white950],

    doctorBackGround: AppColors.doctorBackground,
    colorIcons: Color(0xFFBDBDBD),
  );

  // ---- Light ----
  static const light = GlassTheme(
    primaryBlue: AppColors.primaryBlue,
    hintText: GlassColors.grey850,
    textPrimary: AppColor.black,
    textMuted: AppColor.primary,
    background: AppColors.white,
    colorIcons: Color(0xFFBDBDBD),
    shadow: AppColors.shadow,

    nearbyColor: [AppColors.lightBlue, AppColors.darkBlue],

    surfaceGradient: [GridColor.white800, GridColor.white900],

    borderColors: [AppColor.white, GridColor.white950],

    doctorBackGround: AppColors.doctorBackground,
  );

  @override
  GlassTheme copyWith({
    Color? hintText,
    Color? textPrimary,
    Color? textMuted,
    Color? copyColor,
  }) {
    return GlassTheme(
      hintText: hintText ?? this.hintText,
      textPrimary: textPrimary ?? this.textPrimary,
      textMuted: textMuted ?? this.textMuted,
      background: copyColor ?? background,
      nearbyColor: nearbyColor,
      surfaceGradient: surfaceGradient,
      borderColors: borderColors,
      doctorBackGround: doctorBackGround,
      shadow: shadow,
      colorIcons: colorIcons,
      primaryBlue: primaryBlue,

    );
  }

  @override
  GlassTheme lerp(ThemeExtension<GlassTheme>? other, double t) {
    if (other is! GlassTheme) return this;
    return t < 0.5 ? this : other;
  }
}
