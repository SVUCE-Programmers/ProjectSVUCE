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
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFF5F7FB);
  static const Color textPrimaryColor = Color(0xFF000000);
  static Color dividerColor = Colors.grey[400];
  static const Color textSecondaryColor = Color(0xFF8F8888);
  static const errorColor = Color(0xFFFF6A6A);
}
