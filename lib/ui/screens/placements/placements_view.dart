import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/screens/action_center/graph_representation.dart';

import 'placement_view_model.dart';

class PlacementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<PlacementViewModel>(
      viewModel: PlacementViewModel(),
      onModelReady: (model) => model.getData(),
      builder: (context, uiHelpers, model) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("Placements"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              GraphRepresentation(
                subject: model.yearList,
                graph: model.getGraph(),
                yAxis: [
                  '\300',
                  '\250',
                  '\200',
                  '\150',
                  '\100',
                  '\50',
                  '0',
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
