import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_students_view/add_student_view_model.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_students_view/consumers/updateUserWidget.dart';

import 'consumers/add_user_widget.dart';

class AddStudentView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    return ScreenBuilder<AddStudentViewModel>(
      viewModel: AddStudentViewModel(),
      onModelReady: (m) => m.init(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              onTap: (value) => model.changeIndex(value),
              isScrollable: true,
              labelColor: uiHelpers.textPrimaryColor,
              unselectedLabelColor: uiHelpers.textSecondaryColor,
              labelStyle: uiHelpers.title,
              unselectedLabelStyle: uiHelpers.body,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(right: 20),
              tabs: [
                Tab(
                  text: "Add Users",
                ),
                Tab(
                  text: "Update user",
                )
              ],
              controller: tabController,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AddUserWidget(
                    model: model,
                  ),
                  UpdateUserWidget(
                    model: model,
                  )
                ],
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "${model.index != 0 ? "Update" : "Add"} Student",
              style: uiHelpers.headline,
            ),
            leading: IconButton(
                icon: Icon(
                  backIcon,
                  color: uiHelpers.textPrimaryColor,
                ),
                onPressed: model.navigateBack)),
      ),
    );
  }
}
