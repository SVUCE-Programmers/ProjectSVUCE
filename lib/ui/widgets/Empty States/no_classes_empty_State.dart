import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class NoClassesEmptyState extends StatelessWidget {
  const NoClassesEmptyState({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Container(
        margin: const EdgeInsets.only(right: 20),
        width: uiHelpers.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/illustrations/no_classes.png",
              height: uiHelpers.height * 0.25,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "No classes today ,Enjoy!",
              style: uiHelpers.headline,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "But remember,you got time to study & explore new things,check out our library",
              style: uiHelpers.body,
              textAlign: TextAlign.center,
            ),
            uiHelpers.verticalSpaceLow
          ],
        ));
  }
}
