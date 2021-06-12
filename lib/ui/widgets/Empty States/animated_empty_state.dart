import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class AnimatedEmptyState extends HookWidget {
  final String title, description, buttonTitle, heroTag;
  final String imageAsset;
  final Function onTap;

  const AnimatedEmptyState(
      {Key key,
      @required this.title,
      this.description,
      this.onTap,
      this.heroTag = "Illustration",
      this.buttonTitle,
      @required this.imageAsset})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    final animationController =
        useAnimationController(duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    final Animation<Offset> animation =
        Tween(begin: Offset.zero, end: Offset(0, 0.08))
            .animate(animationController);
    return Scaffold(
      body: Container(
        width: uiHelpers.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SlideTransition(
              position: animation,
              child: Hero(
                tag: "$heroTag",
                child: Image.asset(
                  "$imageAsset",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("$title",
                  style: uiHelpers.title, textAlign: TextAlign.center),
            ),
            description != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("$description",
                        style: uiHelpers.title, textAlign: TextAlign.center),
                  )
                : SizedBox(),
            buttonTitle == null
                ? SizedBox()
                : MaterialButton(
                    child: Text(
                      "$buttonTitle",
                      style: uiHelpers.title
                          .copyWith(color: uiHelpers.primaryColor),
                    ),
                    onPressed: onTap),
          ],
        ),
      ),
    );
  }
}
