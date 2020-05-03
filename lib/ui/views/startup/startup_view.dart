import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';

import 'startp_viewmodel.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<StartUpViewModel>(
      viewModel: StartUpViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text("Startup View"),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        );
      },
    );
  }
}
