import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/loaders/multi_circular_loader.dart';

class ModalHud extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Widget loadingWidget;
  final String loadingText;
  final TextStyle textStyle;

  const ModalHud(
      {Key key,
      this.loadingText,
      this.textStyle,
      @required this.isLoading,
      this.loadingWidget,
      @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    UiHelpers screenUtils = UiHelpers.fromContext(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: screenUtils.height,
      child: Stack(
        children: [
          isLoading ? SizedBox() : child,
          isLoading
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black45,
                    Colors.black38,
                    Colors.black26
                  ])),
                  width: MediaQuery.of(context).size.width,
                  height: screenUtils.height,
                )
              : SizedBox(),
          isLoading
              ? Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Container(
                    width: MediaQuery.of(context).size.width,
                    height: screenUtils.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        loadingWidget ?? MultiCircularLoader(),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          loadingText ?? "Please Wait",
                          style: textStyle ??
                              screenUtils.title.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
