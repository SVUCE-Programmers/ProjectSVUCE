import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/action_center/action_center_viewmodel.dart';

class ActionCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<ActionCenterViewModel>(
      viewModel: ActionCenterViewModel(),
      builder: (context,uiHelpers,model)=>Scaffold(),
    );
  }
}