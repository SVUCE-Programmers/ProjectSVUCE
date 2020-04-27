import 'package:flutter/material.dart';
import 'package:svuce_app/ui/responsive/size_config.dart';

class ResponsiveView extends StatelessWidget {
  final Widget Function(BuildContext context, SizeConfig sizeConfig) builder;

  const ResponsiveView({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    //screen sizes info
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;
    // block is the unit of grid
    var blockSizeHorizontal = screenWidth / 100;
    var blockSizeVertical = screenHeight / 100;

    var safeAreaHorizontal = mediaQuery.padding.left + mediaQuery.padding.right;
    var safeAreaVertical = mediaQuery.padding.top + mediaQuery.padding.bottom;
    // safe area blocks
    var safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    var safeBlockVertical = (screenHeight - safeAreaVertical) / 100;

    var sizingInformation = SizeConfig(
      blockSizeHorizontal: blockSizeHorizontal,
      blockSizeVertical: blockSizeVertical,
      safeBlockHorizontal: safeBlockHorizontal,
      safeBlockVertical: safeBlockVertical,
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      scaleOne: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: blockSizeHorizontal * 8,
          fontWeight: FontWeight.bold),
      scaleTwo: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: blockSizeHorizontal * 5.5,
          fontWeight: FontWeight.w500),
      scaleThree: TextStyle(
        fontFamily: 'Quicksand',
        fontSize: blockSizeHorizontal * 4.8,
      ),
      scaleFour: TextStyle(
        fontFamily: 'Worksans',
        fontSize: blockSizeHorizontal * 4,
      ),
    );

    return builder(context, sizingInformation);
  }
}
