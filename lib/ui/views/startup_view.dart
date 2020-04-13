import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/constants/assets.dart';
import 'package:svuce_app/viewmodels/startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
        viewModel: StartUpViewModel(),
        onModelReady: (model) => model.handleStartUpLogic(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      onboarding,
                      fit: BoxFit.contain,
                    )),
              ),
            ));
  }
}
