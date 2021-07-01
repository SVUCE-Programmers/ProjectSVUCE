import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class NotAvailable extends StatelessWidget {
  final Function onBack;

  const NotAvailable({Key key, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/not_available.json"),
            Text(
              "Sorry,we dont have support to open this file!",
              style: uiHelpers.title,
              textAlign: TextAlign.center,
            ),
            Text(
              "But don't worry you can download this and view in your phone offline!",
              style: uiHelpers.body,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: onBack,
            icon: Icon(
              backIcon,
              color: uiHelpers.textPrimaryColor,
            )),
      ),
    );
  }
}
