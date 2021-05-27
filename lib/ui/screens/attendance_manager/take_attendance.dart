import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/screens/attendance_manager/attendance_view_model.dart';

class TakeAttendancePage extends StatelessWidget {
  final List<int> rollList;

  const TakeAttendancePage({Key key, this.rollList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AttendanceViewModel>(
      viewModel: AttendanceViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                uiHelpers.verticalSpaceMedium,
                ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CheckboxListTile(
                      tileColor: uiHelpers.surfaceColor,
                      value: model.attendanceData[rollList[index]] == "P",
                      onChanged: (value) {
                        model.attendanceData[rollList[index]] = "P";
                      },
                      title: Text("${rollList[index]}"),
                    ),
                  ),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: rollList.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
