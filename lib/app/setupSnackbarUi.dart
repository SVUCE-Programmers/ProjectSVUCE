import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/core/services/theme_service.dart';

import 'colors.dart';
import 'locator.dart';

enum SnackBarType { floating }
void setupSnackbarUi() {
  final ThemeService _themeService = locator<ThemeService>();
  final service = locator<SnackbarService>();
  service.registerCustomSnackbarConfig(
    variant: SnackBarType.floating,
    config: SnackbarConfig(
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
      messageColor: _themeService.isDarkMode
          ? DarkColorPalette.textPrimaryColor
          : LightColorPalette.textPrimaryColor,
      backgroundColor: _themeService.isDarkMode
          ? DarkColorPalette.backgroundColor
          : LightColorPalette.backgroundColor,
      mainButtonTextColor: _themeService.isDarkMode
          ? DarkColorPalette.primaryColor
          : LightColorPalette.primaryColor,
      padding: const EdgeInsets.all(12).copyWith(top: 15),
      textColor: Colors.white,
      overlayBlur: 0,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      barBlur: 2,
      borderRadius: 10,
      dismissDirection: SnackDismissDirection.VERTICAL,
    ),
  );
}
