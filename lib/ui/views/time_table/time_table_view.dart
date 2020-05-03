import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';

import 'time_table_viewmodel.dart';

class TimeTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<TimeTableViewModel>(
      viewModel: TimeTableViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold();
      },
    );
  }
}
