import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/constants/assets.dart';
import 'package:svuce_app/ui/responsive/view.dart';
import 'package:svuce_app/viewmodels/startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
        viewModel: StartUpViewModel(),
        onModelReady: (model) => model.handleStartUpLogic(),
        builder: (context, model, child) => ResponsiveView(
              builder: (context, sizeInfo) => Scaffold(
                body: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      onboarding,
                      fit: BoxFit.contain,
                      width: sizeInfo.blockSizeHorizontal * 50,
                    )),
              ),
            ));
  }
}
