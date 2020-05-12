import 'package:flutter/material.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/models/home_view_item.dart';
import 'package:svuce_app/ui/utils/scaling.dart';

class UIHelpers {
  final double width;
  final double height;

  //block sizes that change according to ui
  final double blockSizeHorizontal;
  final double blockSizeVertical;

  // An Utility tool to help scale things better.
  final ScalingHelper scalingHelper;

  // Text Styles
  final TextStyle headline;
  final TextStyle title;
  final TextStyle body;

  //Vertical Spaces that change accordingly
  final SizedBox verticalSpaceLow;
  final SizedBox verticalSpaceMedium;
  final SizedBox verticalSpaceHigh;

  //Horizontal Spaces that change accordingly
  final SizedBox horizontalSpaceLow;
  final SizedBox horizontalSpaceMedium;
  final SizedBox horizontalSpaceHigh;

  UIHelpers(
      {this.width,
      this.height,
      this.scalingHelper,
      this.headline,
      this.title,
      this.body,
      this.verticalSpaceLow,
      this.verticalSpaceMedium,
      this.verticalSpaceHigh,
      this.horizontalSpaceLow,
      this.horizontalSpaceMedium,
      this.horizontalSpaceHigh,
      this.blockSizeHorizontal,
      this.blockSizeVertical});

  factory UIHelpers.fromContext(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;

    final scalingHelper = ScalingHelper(width: screenWidth);

    final TextStyle headline = TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Quicksand',
        fontSize: scalingHelper.size(28));

    final TextStyle title = TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Quicksand',
        fontSize: scalingHelper.size(20));

    final TextStyle body = TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Quicksand',
        fontSize: scalingHelper.size(18));

    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;

    final verticalSpaceLow = SizedBox(
      height: blockSizeVertical * 3,
    );
    final verticalSpaceMedium = SizedBox(
      height: blockSizeVertical * 7,
    );
    final verticalSpaceHigh = SizedBox(
      height: blockSizeVertical * 11,
    );

    final horizontalSpaceLow = SizedBox(
      width: blockSizeHorizontal * 3,
    );
    final horizontalSpaceMedium = SizedBox(
      width: blockSizeHorizontal * 7,
    );
    final horizontalSpaceHigh = SizedBox(
      width: blockSizeHorizontal * 11,
    );

    UIHelpers uiHelpers = UIHelpers(
      width: screenWidth,
      height: screenHeight,
      blockSizeHorizontal: blockSizeHorizontal,
      blockSizeVertical: blockSizeVertical,
      scalingHelper: scalingHelper,
      body: body,
      headline: headline,
      title: title,
      verticalSpaceLow: verticalSpaceLow,
      verticalSpaceMedium: verticalSpaceMedium,
      verticalSpaceHigh: verticalSpaceHigh,
      horizontalSpaceLow: horizontalSpaceLow,
      horizontalSpaceMedium: horizontalSpaceMedium,
      horizontalSpaceHigh: horizontalSpaceHigh,
    );

    return uiHelpers;
  }
  
}
