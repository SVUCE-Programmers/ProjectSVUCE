import 'package:flutter/material.dart';
import 'package:svuce_app/app/assets.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';

import 'entry_viewmodel.dart';

class EntryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<EntryViewModel>(
      viewModel: EntryViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              // Image as background
              Image.asset(
                hexagonPattern,
                fit: BoxFit.cover,
                color: primaryColor.withOpacity(.5),
                colorBlendMode: BlendMode.multiply,
              ),
              // Here comes the container raising from bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: uiHelpers.blockSizeVertical * 40,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "Get to experience the revamp",
                          style: uiHelpers.headline
                              .copyWith(color: textPrimaryColor),
                        ),
                        TextSpan(
                          text:
                              "\n\nGet involved with what’s happening near you.",
                          style: uiHelpers.title
                              .copyWith(color: textSecondaryColor),
                        ),
                      ])),
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                            color: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            onPressed: () {},
                            child: Text(
                              "Continue",
                              style: uiHelpers.body,
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
