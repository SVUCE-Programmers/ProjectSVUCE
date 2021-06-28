import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/modal_hud.dart';

import 'consumers/staff_widget.dart';
import 'staff_view_model.dart';

class StaffView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 6);
    return ScreenBuilder<StaffViewModel>(
        showLoadingOnBusy: false,
        viewModel: StaffViewModel(),
        disposeViewModel: false,
        onModelReady: (model) => model.getStaff(),
        builder: (context, uiHelpers, model) {
          return ModalHud(
            isLoading: model.isBusy,
            child: Scaffold(
              body: (model.staffList.keys.length == 0)
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          TabBar(
                              physics: BouncingScrollPhysics(),
                              indicatorColor: uiHelpers.primaryColor,
                              indicatorPadding: EdgeInsets.only(right: 15),
                              isScrollable: true,
                              labelColor: uiHelpers.textPrimaryColor,
                              unselectedLabelColor:
                                  uiHelpers.textSecondaryColor,
                              labelStyle: uiHelpers.title,
                              unselectedLabelStyle: uiHelpers.body,
                              indicatorSize: TabBarIndicatorSize.label,
                              controller: tabController,
                              tabs: model.staffList.keys
                                  .map((e) => Tab(child: Text(e)))
                                  .toList()),
                          Expanded(
                            child: TabBarView(
                              physics: BouncingScrollPhysics(),
                              controller: tabController,
                              children: model.staffList.values
                                  .map((staff) => SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ListView.builder(
                                              itemBuilder: (context, index) =>
                                                  StaffWidget(
                                                staffModel: staff[index],
                                              ),
                                              itemCount: staff.length,
                                              primary: false,
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                      )))
                                  .toList(),
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
            ),
          );
        });
  }
}
