import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class TeamViewWidget extends StatelessWidget {
  final Map<String, String> data;
  final double radius;

  const TeamViewWidget({Key key, @required this.data, this.radius = 120})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: FadeInImage(
              image: NetworkImage(data["image"]),
              placeholder: AssetImage("assets/images/logo.png"),
              fit: BoxFit.fill,
              height: radius,
              width: radius,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            data["name"] ?? "",
            style: uiHelpers.title,
            textAlign: TextAlign.center,
          ),
          Text(
            data["role"] ?? "",
            style: uiHelpers.body,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
