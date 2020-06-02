import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/action_center/graph_representation.dart';
import 'package:svuce_app/ui/views/attendance_manager/attendance_view.dart';
import 'package:svuce_app/ui/widgets/time_table_item.dart';

import 'action_center_viewmodel.dart';

class ActionCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<ActionCenterViewModel>(
      viewModel: ActionCenterViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Today Classes",
                  style: uiHelpers.title,
                ),
                subtitle: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AttendanceView()));
                  },
                  child: Text(
                    "See All",
                    style: uiHelpers.body.copyWith(color: primaryColor),
                  ),
                ),
              ),
              Container(
                height: uiHelpers.blockSizeVertical * 15,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: model.timeTableData
                      .map((eachTimeTable) => TimeTableItem(
                            timeTable: eachTimeTable,
                            isActionCenter: true,
                          ))
                      .toList(),
                ),
              ),
              GraphRepresentation(
                graph: model.getGraph(),
                subject: model.subjects,
                yAxis: [
                  '\100',
                  '\80',
                  '\60',
                  '\40',
                  '\20',
                  '0',
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
