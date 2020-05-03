import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';

import 'user_profile_viewmodel.dart';

class UserProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<UserProfileViewModel>(
      viewModel: UserProfileViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold();
      },
    );
  }
}
