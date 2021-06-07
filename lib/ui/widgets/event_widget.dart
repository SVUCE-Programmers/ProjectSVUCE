import 'dart:math';

import 'package:flutter/material.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Container(
        child: Stack(
          children: [
            Container(
              width: uiHelpers.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "${event.name}",
                    style: uiHelpers.headline
                        .copyWith(fontFamily: "LittleLord", fontSize: 40),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                      "${DateTimeUtils().getWholeDate(event.startTime)} | ${event.place}",
                      style: uiHelpers.body),
                  SizedBox(
                    height: 4,
                  ),
                  MaterialButton(
                    color: uiHelpers.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {},
                    child: Text(
                      "Share Event",
                      style: uiHelpers.button.copyWith(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                child: Image.asset(
                  "assets/illustrations/down_blob.png",
                  color: uiHelpers.primaryColor,
                ),
                bottom: 0,
                right: 0),
            Positioned(
                child: Transform.rotate(
                  angle: pi,
                  child: Image.asset(
                    "assets/illustrations/down_blob.png",
                    color: uiHelpers.primaryColor,
                  ),
                ),
                top: 0,
                left: 0),
            Positioned(
                child: Transform.rotate(
                  angle: pi / 2,
                  child: Image.asset(
                    "assets/illustrations/down_blob.png",
                    color: uiHelpers.primaryColor,
                  ),
                ),
                bottom: -5,
                left: -15),
            Positioned(
                child: Transform.rotate(
                  angle: -pi / 2,
                  child: Image.asset(
                    "assets/illustrations/down_blob.png",
                    color: uiHelpers.primaryColor,
                  ),
                ),
                top: -10,
                right: -4)
          ],
        ),
        height: 200,
        width: uiHelpers.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: uiHelpers.surfaceColor,
        ));
  }
}
