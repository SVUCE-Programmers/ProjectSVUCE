import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class StaffWidget extends StatelessWidget {
  const StaffWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiHelpers = UiHelpers.fromContext(context);
    return Container(
      height: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: uiHelpers.surfaceColor,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Image.asset(
              "assets/images/logo.png",
              color: uiHelpers.primaryColor,
              alignment: Alignment.bottomCenter,
              height: 80,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Shashi Kumar",
            style: uiHelpers.title,
          ),
          Text("Professor")
        ],
      ),
    );
  }
}
