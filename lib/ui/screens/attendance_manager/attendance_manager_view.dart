import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/widgets/Empty%20States/animated_empty_state.dart';
import 'package:svuce_app/ui/widgets/bottom%20sheets/add_new_subject_attendance.dart';
import 'package:svuce_app/ui/widgets/graphs/pie_chart.dart';
import 'attendance_manager_view_model.dart';
import 'widgets/attendance_item.dart';

class AttendanceManagerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AttendanceManagerViewModel>(
      showLoadingOnBusy: false,
      onModelReady: (m) => m.getAttendance(),
      builder: (context, uiHelpers, model) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => addNewSubject(context, model),
          backgroundColor: uiHelpers.primaryColor,
          child: Icon(Icons.add),
        ),
        body: model.attendanceList.length == 0
            ? AnimatedEmptyState(
                title: "Plan your bunks with this latest attendance feature",
                imageAsset: "assets/illustrations/attendance.png",
                heroTag: "Attendance Hero",
                buttonTitle: "Add New Subject",
                onTap: () => addNewSubject(context, model),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    PieChartWidget(
                        totalClasses: model.totalClasses(),
                        totalPresentClasses: model.totalPresentClasses(),
                        chartData: model.generatePieChartData(),
                        attendanceList: model.attendanceList ?? []),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      itemCount: model.attendanceList.length,
                      itemBuilder: (context, index) {
                        return AttendanceItem(index);
                      },
                    ),
                  ],
                ),
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
      ),
      viewModel: AttendanceManagerViewModel(),
    );
  }
}
