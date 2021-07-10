import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/core/services/theme_service.dart';

import 'colors.dart';
import 'locator.dart';

enum SnackBarType { success, info, error, floating }
void setupSnackbarUi() {
  final ThemeService _themeService = locator<ThemeService>();
  final service = locator<SnackbarService>();
  service.registerCustomSnackbarConfig(
    variant: SnackBarType.success,
    config: SnackbarConfig(
      icon: Icon(
        FontAwesome5Solid.smile_beam,
        color: Colors.green,
      ),
      titleColor: _themeService.isDarkMode
          ? DarkColorPalette.textPrimaryColor
          : LightColorPalette.textPrimaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
      messageColor: _themeService.isDarkMode
          ? DarkColorPalette.textSecondaryColor
          : LightColorPalette.textSecondaryColor,
      backgroundColor: _themeService.isDarkMode
          ? DarkColorPalette.surfaceColor
          : LightColorPalette.surfaceColor,
      mainButtonTextColor: _themeService.isDarkMode
          ? DarkColorPalette.primaryColor
          : LightColorPalette.primaryColor,
      padding: const EdgeInsets.all(12).copyWith(top: 15),
      textColor: Colors.white,
      overlayBlur: 0,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      barBlur: 1,
      borderRadius: 10,
      dismissDirection: SnackDismissDirection.VERTICAL,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.info,
    config: SnackbarConfig(
      icon: Icon(FontAwesome5Solid.frown_open, color: Colors.orange),
      titleColor: _themeService.isDarkMode
          ? DarkColorPalette.textPrimaryColor
          : LightColorPalette.textPrimaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
      messageColor: _themeService.isDarkMode
          ? DarkColorPalette.textSecondaryColor
          : LightColorPalette.textSecondaryColor,
      backgroundColor: _themeService.isDarkMode
          ? DarkColorPalette.surfaceColor
          : LightColorPalette.surfaceColor,
      mainButtonTextColor: _themeService.isDarkMode
          ? DarkColorPalette.primaryColor
          : LightColorPalette.primaryColor,
      padding: const EdgeInsets.all(12).copyWith(top: 15),
      textColor: Colors.white,
      overlayBlur: 0,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      barBlur: 1,
      borderRadius: 10,
      dismissDirection: SnackDismissDirection.VERTICAL,
    ),
  );
  service.registerCustomSnackbarConfig(
    variant: SnackBarType.error,
    config: SnackbarConfig(
      icon: Icon(FontAwesome5Solid.sad_tear, color: Colors.red),
      titleColor: _themeService.isDarkMode
          ? DarkColorPalette.textPrimaryColor
          : LightColorPalette.textPrimaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
      messageColor: _themeService.isDarkMode
          ? DarkColorPalette.textSecondaryColor
          : LightColorPalette.textSecondaryColor,
      backgroundColor: _themeService.isDarkMode
          ? DarkColorPalette.surfaceColor
          : LightColorPalette.surfaceColor,
      mainButtonTextColor: _themeService.isDarkMode
          ? DarkColorPalette.primaryColor
          : LightColorPalette.primaryColor,
      padding: const EdgeInsets.all(12).copyWith(top: 15),
      textColor: Colors.white,
      overlayBlur: 0,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      barBlur: 1,
      borderRadius: 10,
      dismissDirection: SnackDismissDirection.VERTICAL,
    ),
  );
  service.registerCustomSnackbarConfig(
    variant: SnackBarType.floating,
    config: SnackbarConfig(
      titleColor: _themeService.isDarkMode
          ? DarkColorPalette.textPrimaryColor
          : LightColorPalette.textPrimaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
      messageColor: _themeService.isDarkMode
          ? DarkColorPalette.textSecondaryColor
          : LightColorPalette.textSecondaryColor,
      backgroundColor: _themeService.isDarkMode
          ? DarkColorPalette.surfaceColor
          : LightColorPalette.surfaceColor,
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
