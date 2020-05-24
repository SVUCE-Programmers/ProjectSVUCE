import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/placements/placement_view_model.dart';

class PlacementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<PlacementViewModel>(
      viewModel: PlacementViewModel(),
      onModelReady: (model) => model.getData(),
      builder: (context, uiHelpers, model) => Scaffold(
        
      ),
    );
  }
}
