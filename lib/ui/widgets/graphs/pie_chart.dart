import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> pieCharSelectionData = [
      PieChartSectionData(
          value: 25, color: Colors.blue, radius: 25, showTitle: false),
      PieChartSectionData(
          value: 20, color: Color(0xFF26E5FF), radius: 22, showTitle: false),
      PieChartSectionData(
          value: 10, color: Color(0xFFFFCF26), radius: 19, showTitle: false),
      PieChartSectionData(
          value: 15, color: Color(0xFFEE2727), radius: 16, showTitle: false),
      PieChartSectionData(
          value: 25,
          color: Colors.blue.withOpacity(0.1),
          radius: 13,
          showTitle: false),
    ];
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              sections: pieCharSelectionData,
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
                      .copyWith(fontWeight: FontWeight.w600, height: 0.5)),
              Text("of 128GB")
            ],
          ))
        ],
      ),
    );
  }
}
