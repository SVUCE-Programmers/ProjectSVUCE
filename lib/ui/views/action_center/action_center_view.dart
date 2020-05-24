import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/models/graph.dart';
import 'package:svuce_app/ui/views/attendance_manager/attendance_view.dart';
import 'package:svuce_app/ui/widgets/graph_widget.dart';
import 'package:svuce_app/ui/widgets/time_table_item.dart';

import 'action_center_viewmodel.dart';

class ActionCenter extends StatefulWidget {
  @override
  _ActionCenterState createState() => _ActionCenterState();
}

class _ActionCenterState extends State<ActionCenter> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Graph _graph;
  
  @override
  void initState() {
    _graph=ActionCenterViewModel().getGraph();
    _controller=AnimationController(vsync: this);
    _controller.addListener(() { 
      final d=_controller.value-_graph.domainStart;
     if (d < 0) {
        _graph.domainStart += d;
        _graph.domainEnd += d;
      } else {
        _graph.domainEnd += d;
        _graph.domainStart += d;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<ActionCenterViewModel>(
      viewModel: ActionCenterViewModel(),
      onModelReady: (model) => model.getTimeTable(),
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AttendanceView()));
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
              Container(
                child: Center(
                  child: GraphWidget(
                    graph: model.getGraph(),
                    subjects: model.subjects,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
