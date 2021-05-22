import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';

import 'startp_viewmodel.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<StartUpViewModel>(
      viewModel: StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(context),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Text(
              "SVUCE APP",
              style:
                  uiHelpers.title.copyWith(color: uiHelpers.textPrimaryColor),
            ),
          ),
        );
      },
    );
  }
}
