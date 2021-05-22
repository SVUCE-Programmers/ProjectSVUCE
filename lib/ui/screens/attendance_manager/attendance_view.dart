import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'widgets/attendance_item.dart';

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
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      PieChart(PieChartData(
                          sectionsSpace: 0,
                          centerSpaceRadius: 70,
                          sections: model.pieCharSelectionData,
                          startDegreeOffset: -90)),
                      Positioned.fill(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 16),
                          Text("29.1",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      height: 0.5)),
                          Text("of 128GB")
                        ],
                      ))
                    ],
                  ),
                ),
              ],
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
