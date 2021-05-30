import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';

class PieChartWidget extends StatelessWidget {
  final List<PieChartSectionData> chartData;
  final int totalClasses, totalPresentClasses;
  final List<Attendance> attendanceList;

  const PieChartWidget(
      {Key key,
      this.chartData,
      this.totalClasses,
      this.totalPresentClasses,
      this.attendanceList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              PieChart(PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 70,
                  sections: chartData,
                  startDegreeOffset: -90)),
              Positioned.fill(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 8),
                  Text("$totalPresentClasses", style: uiHelpers.title),
                  Text(
                    "of $totalClasses Classes",
                    style: uiHelpers.body.copyWith(fontSize: 14),
                  )
                ],
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: uiHelpers.width * 0.33 / 50),
              itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(attendanceList[index].color)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text("${attendanceList[index].subject}",
                              style: uiHelpers.title),
                        )
                      ],
                    ),
                  ),
              itemCount: attendanceList.length,
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics()),
        )
      ],
    );
  }
}
