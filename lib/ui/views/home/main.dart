import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';

import 'main_home_viewmodel.dart';

class MainHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<MainHomeViewModel>(
      viewModel: MainHomeViewModel(),
      disposeViewModel: false,
      builder: (context, uiHelpers, model) {
        return Scaffold();
      },
    );
  }
}
