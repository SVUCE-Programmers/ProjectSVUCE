import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/select_clubs/select_clubs_viewmodel.dart';

class SelectClubsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<SelectClubsViewModel>(
      viewModel: SelectClubsViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold();
      },
    );
  }
}
