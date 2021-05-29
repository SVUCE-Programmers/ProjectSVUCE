import 'package:flutter/material.dart';

import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class EventListItem extends StatelessWidget {
  final Event event;

  final Function onTap;

  const EventListItem({Key key, this.event, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Image.network(
          event.imageUrl,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(event.name),
      subtitle: Text(
        event.place + "|" + event.timeStamp.toString(),
      ),
      trailing: Icon(
        forwardIcon,
        color: uiHelpers.textPrimaryColor,
      ),
      isThreeLine: true,
      onTap: onTap,
    );
  }
}
