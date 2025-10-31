import 'package:flutter/material.dart';

enum AppTheme { light, dark }

class SleepThemeColors {
  final Color background;
  final Color cardBackground;
  final Color primaryText;
  final Color secondaryText;
  final Color tertiaryText;
  final Color accentBlue;
  final Color chartLine;
  final Color diagonalStripes;
  final Color typicalRangeMarker;

  const SleepThemeColors({
    required this.background,
    required this.cardBackground,
    required this.primaryText,
    required this.secondaryText,
    required this.tertiaryText,
    required this.accentBlue,
    required this.chartLine,
    required this.diagonalStripes,
    required this.typicalRangeMarker,
  });

  static const dark = SleepThemeColors(
    background: Color(0xFF1A1D26),
    cardBackground: Color(0xFF252830),
    primaryText: Colors.white,
    secondaryText: Color(0xFFB0B0B0),
    tertiaryText: Color(0xFF808080),
    accentBlue: Color(0xFF6BA5CF),
    chartLine: Color(0xFF6BA5CF),
    diagonalStripes: Color(0xFF616161),
    typicalRangeMarker: Color(0xFF757575),
  );

  static const light = SleepThemeColors(
    background: Color(0xFFF5F5F5),
    cardBackground: Colors.white,
    primaryText: Color(0xFF1A1D26),
    secondaryText: Color(0xFF555555),
    tertiaryText: Color(0xFF888888),
    accentBlue: Color(0xFF2E7DAF),
    chartLine: Color(0xFF2E7DAF),
    diagonalStripes: Color(0xFFD0D0D0),
    typicalRangeMarker: Color(0xFFAAAAAA),
  );
}
