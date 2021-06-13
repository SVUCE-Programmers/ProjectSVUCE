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
                ],
              ),
            ),
            Positioned(
                top: -30,
                left: -45,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: uiHelpers.primaryColor,
                )),
            Positioned(
                top: 30,
                left: uiHelpers.width * 0.8,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: uiHelpers.primaryColor,
                )),
            Positioned(
                bottom: -30,
                right: -35,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: uiHelpers.primaryColor,
                )),
          ],
        ),
        height: 200,
        width: uiHelpers.width,
        decoration: BoxDecoration(
          color: uiHelpers.surfaceColor,
        ));
  }
}
