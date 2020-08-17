import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';

import 'notifications_viewmodel.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<NotificationsViewModel>(
      viewModel: NotificationsViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold();
      },
    );
  }
}
