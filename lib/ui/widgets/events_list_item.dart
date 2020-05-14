import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/models/event.dart';

class EventListItem extends StatelessWidget {
  final Event event;

  final Function onTap;

  const EventListItem({Key key, this.event, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      title: Text(event.eventName),
      subtitle: Text(
        event.place + "|" + DateTime.parse(event.timeStamp).toString(),
      ),
      trailing: Icon(
        forwardIcon,
        color: textPrimaryColor,
      ),
      isThreeLine: true,
      onTap: onTap,
    );
  }
}
