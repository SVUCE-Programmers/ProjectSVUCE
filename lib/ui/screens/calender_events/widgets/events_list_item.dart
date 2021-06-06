import 'package:flutter/material.dart';

import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class EventListItem extends StatelessWidget {
  final Event event;

  final Function onTap;

  const EventListItem({Key key, this.event, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
          color: uiHelpers.surfaceColor,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              event.name,
              style: uiHelpers.title,
            ),
            subtitle: Text.rich(
              TextSpan(
                  text: event.description.length > 60
                      ? event.description.substring(0, 60) + "...."
                      : event.description),
              style: uiHelpers.body,
            ),
            leading: Column(
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: DateTimeUtils().getMonth(event.timeStamp, true) +
                            "\n"),
                    TextSpan(
                      text: DateTimeUtils().getDate(event.timeStamp).toString(),
                      style: uiHelpers.title.copyWith(fontSize: 24),
                    )
                  ]),
                  textAlign: TextAlign.center,
                  style: uiHelpers.title,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )
        ],
      ),
    );
  }
}
