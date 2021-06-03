import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class GreetingWidget extends HookWidget {
  const GreetingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    final dateTime = useState(DateTime.now());

    String getGreeting() {
      var h = dateTime.value.hour;
      if (h < 12) {
        return "Good Morning";
      } else if (h < 17) {
        return "Good Afternoon";
      } else if (h < 22) {
        return "Good Evening";
      } else {
        return "Good Night";
      }
    }

    String getImage() {
      var h = dateTime.value.hour;
      if (h < 12) {
        return "assets/images/morning.png";
      } else if (h < 17) {
        return "assets/images/afternoon.png";
      } else if (h < 22) {
        return "assets/images/evening.png";
      } else {
        return "assets/images/night.png";
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          getGreeting(),
          style: uiHelpers.body.copyWith(fontSize: 14),
        ),
        Image.asset(
          getImage(),
          height: 20,
        )
      ],
    );
  }
}
