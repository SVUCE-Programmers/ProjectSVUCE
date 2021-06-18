import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/widgets/loaders/multi_circular_loader.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                model.isLottieLoaded
                    ? Lottie.asset("assets/lottie/dashboard_setting.json",
                        alignment: Alignment.bottomCenter,
                        onLoaded: (composition) => model.changeToLoaded())
                    : MultiCircularLoader(),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Please wait while we are setting up your dashboard",
                    style: uiHelpers.title,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
            ),
          ),
        );
      },
    );
  }
}
