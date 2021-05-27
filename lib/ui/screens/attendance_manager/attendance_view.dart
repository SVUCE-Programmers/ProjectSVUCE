import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

import 'attendance_view_model.dart';

class AttendanceView extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AttendanceViewModel>(
      viewModel: AttendanceViewModel(),
      onModelReady: (model) => model.init(),
      disposeViewModel: false,
      builder: (context, uiHelpers, model) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: uiHelpers.primaryColor,
          onPressed: () {},
          child: Icon(Icons.add),
          tooltip: "Add Sheet",
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                backIcon,
                color: uiHelpers.textPrimaryColor,
              ),
              onPressed: model.navigateBack),
          title: Text(
            "Attendance Manager",
            style:
                uiHelpers.headline.copyWith(color: uiHelpers.textPrimaryColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ),
      ),
    );
  }

  bottomSheet(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Container(
      color: Colors.transparent,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            color: uiHelpers.surfaceColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.undo,
                color: uiHelpers.primaryColor,
              ),
              title: Text("Undo"),
            ),
            ListTile(
              leading: Icon(
                Icons.unfold_less,
                color: uiHelpers.primaryColor,
              ),
              title: Text("Reset"),
            )
          ],
        ),
      ),
    );
  }
}
