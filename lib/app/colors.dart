import 'package:flutter/material.dart';

mixin DarkColorPalette {
  static const primaryColor = Color(0xFF1EEBB3);
  static const backgroundColor = Color(0xFF071D34);
  static const surfaceColor = Color(0xFF1C3146);
  static const textPrimaryColor = Color(0xFFFFFFFF);
  static const textSecondaryColor = Color(0xFF607185);
  static const errorColor = Color(0xFFFF6A6A);
  static const dividerColor = Color(0xFFA8B9CC);
}

mixin LightColorPalette {
  static const Color primaryColor = Color(0xFF0900C3);
  static const Color backgroundColor = Color(0xFFF5F7FB);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color textPrimaryColor = Color(0xFF000000);
  static Color dividerColor = Colors.grey[400];
  static const Color textSecondaryColor = Color(0xFF8F8888);
  static const errorColor = Color(0xFFFF6A6A);
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];
  static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    GradientColors(GradientColors.mango),
    GradientColors(GradientColors.fire),
  ];
}
