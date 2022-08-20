import 'package:flutter/material.dart';

import 'dark_palette.dart';
import 'light_palette.dart';

class Palette {
  final Color primary;
  final Color secondary;
  final Color tersiary;
  final Color error;
  final Color surface;
  final Color background;
  final Color divider;
  final Color lightGrey;
  final Color grey;
  final Color lightGreen;
  final Color onPrimary;
  final Color onSecondary;
  final Color onError;
  final Color onSurface;
  final Color onBackground;
  final Brightness brightness;

  const Palette({
    required this.primary,
    required this.secondary,
    required this.tersiary,
    required this.error,
    required this.surface,
    required this.background,
    required this.divider,
    required this.lightGrey,
    required this.grey,
    required this.lightGreen,
    required this.onPrimary,
    required this.onSecondary,
    required this.onError,
    required this.onSurface,
    required this.onBackground,
    required this.brightness,
  });

  ColorScheme toColorScheme() {
    return ColorScheme(
      primary: primary,
      primaryContainer: primary,
      secondary: primary,
      secondaryContainer: primary,
      surface: surface,
      background: background,
      error: error,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
      brightness: brightness,
    );
  }

  static Palette of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightPalette
        : darkPalette;
  }

  Palette copyWith({
    Color? primary,
    Color? secondary,
    Color? tersiary,
    Color? error,
    Color? surface,
    Color? background,
    Color? divider,
    Color? lightGrey,
    Color? grey,
    Color? lightGreen,
    Color? onPrimary,
    Color? onSecondary,
    Color? onError,
    Color? onSurface,
    Color? onBackground,
    Brightness? brightness,
  }) {
    return Palette(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tersiary: tersiary ?? this.tersiary,
      error: error ?? this.error,
      surface: surface ?? this.surface,
      background: background ?? this.background,
      divider: divider ?? this.divider,
      lightGrey: lightGrey ?? this.lightGrey,
      grey: grey ?? this.grey,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onError: onError ?? this.onError,
      onSurface: onSurface ?? this.onSurface,
      onBackground: onBackground ?? this.onBackground,
      brightness: brightness ?? this.brightness,
      lightGreen: lightGreen ?? this.lightGreen,
    );
  }
}
