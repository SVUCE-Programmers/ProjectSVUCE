import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/time_table/Edit%20TimeTable/EditTimeTableViewModel.dart';

class EditTimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<EditTimeTableViewModel>(
      viewModel: EditTimeTableViewModel(),
      onModelReady: (m) => m.init(),
      builder: (context, uiHelpers, model) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(addIcon),
          onPressed: () {},
          backgroundColor: uiHelpers.primaryColor,
        ),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                backIcon,
                color: uiHelpers.textPrimaryColor,
              ),
              onPressed: () => model.navigateBack()),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Edit TimeTable",
            style:
                uiHelpers.headline.copyWith(color: uiHelpers.textPrimaryColor),
          ),
        ),
        body: Center(
          child: Container(
            child: Text('EditTimeTable'),
          ),
        ),
      ),
    );
  }
}
