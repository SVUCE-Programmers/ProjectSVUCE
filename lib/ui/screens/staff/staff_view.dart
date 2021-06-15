import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';

import 'consumers/staff_widget.dart';
import 'staff_view_model.dart';

class StaffView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 6);
    return ScreenBuilder<StaffViewModel>(
        viewModel: StaffViewModel(),
        disposeViewModel: false,
        onModelReady: (model) => model.getStaff(),
        builder: (context, uiHelpers, model) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  TabBar(
                      physics: BouncingScrollPhysics(),
                      indicatorColor: uiHelpers.primaryColor,
                      indicatorPadding: EdgeInsets.only(right: 15),
                      isScrollable: true,
                      labelColor: uiHelpers.textPrimaryColor,
                      unselectedLabelColor: uiHelpers.textSecondaryColor,
                      labelStyle: uiHelpers.title,
                      unselectedLabelStyle: uiHelpers.body,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: tabController,
                      tabs: [
                        "Computer Science",
                        "ECE",
                        "Mechanical",
                        "Civil",
                        "Chemical",
                        "EEE"
                      ].map((e) => Tab(child: Text(e))).toList()),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          uiHelpers.verticalSpaceLow,
                          Text(
                            "Head of Department",
                            style: uiHelpers.title,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: StaffWidget(),
                          ),
                          uiHelpers.verticalSpaceMedium,
                          Text(
                            "Professors",
                            style: uiHelpers.title,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 180,
                            child: ListView.builder(
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: StaffWidget(),
                              ),
                              itemCount: 10,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          uiHelpers.verticalSpaceMedium,
                          Text(
                            "Assistant Professors",
                            style: uiHelpers.title,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 180,
                            child: ListView.builder(
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: StaffWidget(),
                              ),
                              itemCount: 10,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          uiHelpers.verticalSpaceMedium,
                          Text(
                            "Lab Assistants & Others",
                            style: uiHelpers.title,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GridView.builder(
                                primary: false,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15,
                                        crossAxisCount: 2),
                                itemCount: 50,
                                itemBuilder: (context, index) => StaffWidget()),
                          ),
                          uiHelpers.verticalSpaceHigh,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Text(
                "Staff",
                style: uiHelpers.headline,
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: model.goBack,
                  icon: Icon(
                    backIcon,
                    color: uiHelpers.textPrimaryColor,
                  )),
            ),
          );
        });
  }
}
