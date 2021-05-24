import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';

import 'package:svuce_app/app/configs.dart';
import 'package:svuce_app/core/utils/scaling.dart';

class UiHelpers {
  double width;
  double height;

  //block sizes that change according to ui
  double blockSizeHorizontal;
  double blockSizeVertical;

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

  UiHelpers.fromContext(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;
    width = screenWidth;
    height = screenHeight;

    scalingHelper = ScalingHelper(width: screenWidth);

    primaryColor = LightColorPalette.primaryColor;
    backgroundColor = LightColorPalette.backgroundColor;
    surfaceColor = LightColorPalette.surfaceColor;
    textPrimaryColor = LightColorPalette.textPrimaryColor;
    textSecondaryColor = LightColorPalette.textSecondaryColor;
    dividerColor = LightColorPalette.dividerColor;

    headline = TextStyle(
        decoration: TextDecoration.none,
        fontFamily: Configs.headlineFont,
        color: LightColorPalette.textPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: scalingHelper.size(24));

    title = TextStyle(
        decoration: TextDecoration.none,
        fontFamily: Configs.titleFont,
        color: LightColorPalette.textPrimaryColor,
        fontWeight: FontWeight.w700,
        fontSize: scalingHelper.size(18));

    body = TextStyle(
        decoration: TextDecoration.none,
        color: LightColorPalette.textSecondaryColor,
        fontFamily: Configs.bodyFont,
        fontWeight: FontWeight.w300,
        fontSize: scalingHelper.size(16));

    button = TextStyle(
        decoration: TextDecoration.none,
        fontFamily: Configs.headlineFont,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: scalingHelper.size(18));

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    verticalSpaceLow = SizedBox(
      height: blockSizeVertical * 3,
    );
    verticalSpaceMedium = SizedBox(
      height: blockSizeVertical * 7,
    );
    verticalSpaceHigh = SizedBox(
      height: blockSizeVertical * 11,
    );

    horizontalSpaceLow = SizedBox(
      width: blockSizeHorizontal * 3,
    );
    horizontalSpaceMedium = SizedBox(
      width: blockSizeHorizontal * 7,
    );
    horizontalSpaceHigh = SizedBox(
      width: blockSizeHorizontal * 11,
    );
  }
}
