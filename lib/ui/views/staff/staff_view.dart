import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/staff/staff_main.dart';
import 'package:svuce_app/ui/views/staff/staff_view_model.dart';

class StaffView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<StaffViewModel>(
      viewModel: StaffViewModel(),
      disposeViewModel: false,
      builder: (context, uiHelpers, model) {
        return Container(
          child: DefaultTabController(length: 3, child: Scaffold(
            appBar: AppBar(
              title: Text("Staff",style: TextStyle(),),
              centerTitle: true,
              backgroundColor: primaryColor,
              elevation: 0,
              bottom: TabBar(
                labelColor: primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  color:backgroundColor
                  ),
                tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Main",),
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
              ],),
              
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TabBarView(children: [
                StaffMain(),
                Container(),
                Container()
              ]),
            ),
          )),
        );
    });
  } 
  
}