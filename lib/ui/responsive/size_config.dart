import 'package:flutter/material.dart';

class SizeConfig {
  final double screenWidth;
  final double screenHeight;
  final double blockSizeHorizontal;
  final double blockSizeVertical;

  final double safeBlockHorizontal;
  final double safeBlockVertical;

  final TextStyle scaleOne; //This is for title and heading
  final TextStyle scaleTwo; // This is for subheading
  final TextStyle scaleThree; // This is for labels
  final TextStyle scaleFour; // This is for body.

  SizeConfig({
    this.screenWidth,
    this.screenHeight,
    this.blockSizeHorizontal,
    this.blockSizeVertical,
    this.safeBlockHorizontal,
    this.safeBlockVertical,
    this.scaleOne,
    this.scaleTwo,
    this.scaleThree,
    this.scaleFour,
  });
}
