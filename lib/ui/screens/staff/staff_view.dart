import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';

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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
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
                  uiHelpers.verticalSpaceLow,
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: uiHelpers.dividerColor),
                                  borderRadius: BorderRadius.circular(12)),
                              child: GridTile(
                                child: SizedBox(),
                                footer: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: Image.asset(
                                        "assets/images/logo.png",
                                        color: uiHelpers.primaryColor,
                                        alignment: Alignment.bottomCenter,
                                        height: 80,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Shashi Kumar",
                                      style: uiHelpers.title,
                                    ),
                                    Text("Professor")
                                  ],
                                ),
                              ),
                            )),
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
