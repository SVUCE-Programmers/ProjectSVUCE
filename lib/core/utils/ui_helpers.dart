import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';

import 'package:svuce_app/app/configs.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/theme_service.dart';
import 'package:svuce_app/core/utils/scaling.dart';

enum DeviceType { android, ios, fuschia, web, windows, mac, linux }

enum ScreenType { mobile, tablet }

class UiHelpers {
  Orientation orientation;

  DeviceType deviceType;
  ScreenType screenType;

  double width;
  double height;

  double pixelRatio;
  double pixelDensity;

  //block sizes that change according to ui
  double blockSizeHorizontal;
  double blockSizeVertical;
  double sp;

  // An Utility tool to help scale things better.
  ScalingHelper scalingHelper;

  // Text Styles
  TextStyle headline;
  TextStyle title;
  TextStyle body;
  TextStyle button;

  Color primaryColor;
  Color backgroundColor;
  Color textPrimaryColor;
  Color textSecondaryColor;
  Color surfaceColor;
  Color dividerColor;

  //Vertical Spaces that change accordingly
  SizedBox verticalSpaceLow;
  SizedBox verticalSpaceMedium;
  SizedBox verticalSpaceHigh;

  //Horizontal Spaces that change accordingly
  SizedBox horizontalSpaceLow;
  SizedBox horizontalSpaceMedium;
  SizedBox horizontalSpaceHigh;
  bool isDark;
  Size size;
  MediaQueryData mediaQuery;

  UiHelpers.fromContext(BuildContext context) {
    final ThemeService _themeService = locator<ThemeService>();
    isDark = _themeService.darkMode.value;

    orientation = MediaQuery.of(context).orientation;

    mediaQuery = MediaQuery.of(context);
    size = mediaQuery.size;
    width = mediaQuery.size.width;
    height = mediaQuery.size.height;

    scalingHelper = ScalingHelper(width: width);
    pixelRatio = WidgetsBinding.instance.window.devicePixelRatio ?? 1;
    pixelDensity =
        pixelRatio * (width > height ? (width / height) : (height / width));
    sp = ((width > height) ? width : height) / pixelDensity / 100;

    primaryColor = _themeService.isDarkMode
        ? DarkColorPalette.primaryColor
        : LightColorPalette.primaryColor;
    backgroundColor = _themeService.isDarkMode
        ? DarkColorPalette.backgroundColor
        : LightColorPalette.backgroundColor;
    surfaceColor = _themeService.isDarkMode
        ? DarkColorPalette.surfaceColor
        : LightColorPalette.surfaceColor;
    textPrimaryColor = _themeService.isDarkMode
        ? DarkColorPalette.textPrimaryColor
        : LightColorPalette.textPrimaryColor;
    textSecondaryColor = _themeService.isDarkMode
        ? DarkColorPalette.textSecondaryColor
        : LightColorPalette.textSecondaryColor;
    dividerColor = _themeService.isDarkMode
        ? DarkColorPalette.dividerColor
        : LightColorPalette.dividerColor;

    headline = TextStyle(
        decoration: TextDecoration.none,
        fontFamily: Configs.headlineFont,
        color: textPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 18 * sp);

    title = TextStyle(
        decoration: TextDecoration.none,
        fontFamily: Configs.titleFont,
        color: textPrimaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 12 * sp);

    body = TextStyle(
        decoration: TextDecoration.none,
        color: textSecondaryColor,
        fontFamily: Configs.bodyFont,
        fontWeight: FontWeight.w300,
        fontSize: 10 * sp);

    button = TextStyle(
        decoration: TextDecoration.none,
        fontFamily: Configs.headlineFont,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: 12 * sp);

    blockSizeHorizontal = width / 100;
    blockSizeVertical = height / 100;

    verticalSpaceLow = SizedBox(
      height: blockSizeVertical * 1.5,
    );
    verticalSpaceMedium = SizedBox(
      height: blockSizeVertical * 4,
    );
    verticalSpaceHigh = SizedBox(
      height: blockSizeVertical * 7,
    );

    horizontalSpaceLow = SizedBox(
      width: blockSizeHorizontal * 1.5,
    );
    horizontalSpaceMedium = SizedBox(
      width: blockSizeHorizontal * 4,
    );
    horizontalSpaceHigh = SizedBox(
      width: blockSizeHorizontal * 7,
    );
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          deviceType = DeviceType.android;
          break;
        case TargetPlatform.iOS:
          deviceType = DeviceType.ios;
          break;
        case TargetPlatform.windows:
          deviceType = DeviceType.windows;
          break;
        case TargetPlatform.macOS:
          deviceType = DeviceType.mac;
          break;
        case TargetPlatform.linux:
          deviceType = DeviceType.linux;
          break;
        case TargetPlatform.fuchsia:
          deviceType = DeviceType.fuschia;
          break;
      }
    }

    // Sets ScreenType
    if ((orientation == Orientation.portrait && width < 600) ||
        (orientation == Orientation.landscape && height < 600)) {
      screenType = ScreenType.mobile;
    } else {
      screenType = ScreenType.tablet;
    }
  }
}
