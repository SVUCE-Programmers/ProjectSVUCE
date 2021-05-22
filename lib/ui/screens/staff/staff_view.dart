import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';

import 'staff_main.dart';
import 'staff_view_model.dart';

class StaffView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<StaffViewModel>(
        viewModel: StaffViewModel(),
        disposeViewModel: false,
        onModelReady: (model) => model.getStaff(),
        builder: (context, uiHelpers, model) {
          return Container(
            child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(
                      "Staff",
                      style: TextStyle(),
                    ),
                    centerTitle: true,
                    backgroundColor: uiHelpers.primaryColor,
                    elevation: 0,
                    bottom: TabBar(
                      labelColor: uiHelpers.primaryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.white,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: uiHelpers.backgroundColor),
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Main",
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Department"),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Assistants"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TabBarView(
                        children: [StaffMain(), Container(), Container()]),
                  ),
                )),
          );
        });
  }
}
