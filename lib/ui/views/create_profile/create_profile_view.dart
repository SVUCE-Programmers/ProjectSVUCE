import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';

import 'create_profile_viewmodel.dart';

class CreateProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CreateProfileViewModel>(
      viewModel: CreateProfileViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold();
      },
    );
  }
}