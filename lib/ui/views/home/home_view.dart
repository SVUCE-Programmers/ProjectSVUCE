import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<HomeViewModel>(
      viewModel: HomeViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          body: Center(
            child: Text("Home"),
          ),
        );
      },
    );
  }
}
