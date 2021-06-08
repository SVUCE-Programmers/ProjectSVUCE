import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class OfflineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: uiHelpers.width * 0.08),
      child: Column(
        children: [
          LottieBuilder.asset(
            "assets/lottie/no_internet.json",
            animate: true,
            alignment: Alignment.bottomCenter,
          ),
          Text(
            "No Internet Connection",
            style: uiHelpers.headline,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'The only connection between you and me is internet, Please turn it on.',
            style: uiHelpers.body,
            textAlign: TextAlign.center,
          ),
          MaterialButton(
              onPressed: () {},
              child: Text(
                "Try again!",
                style: uiHelpers.button.copyWith(color: uiHelpers.primaryColor),
              ))
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
      ),
    ));
  }
}
