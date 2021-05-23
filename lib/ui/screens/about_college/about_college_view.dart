import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/about_college/about_college_view_model.dart';
import 'package:svuce_app/ui/screens/about_college/teqip_page.dart';

class AboutCollegeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 4);
    return ScreenBuilder<AboutCollegeViewModel>(
      viewModel: AboutCollegeViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
                labelStyle: uiHelpers.title,
                unselectedLabelStyle: uiHelpers.body,
                labelColor: uiHelpers.textPrimaryColor,
                unselectedLabelColor: uiHelpers.textSecondaryColor,
                controller: tabController,
                tabs: [
                  Tab(
                    icon: Text("TEQIP"),
                  ),
                  Tab(
                    icon: Text("Teqip"),
                  ),
                  Tab(
                    icon: Text("Teqip"),
                  ),
                  Tab(
                    icon: Text("Teqip"),
                  )
                ]),
            Expanded(
                child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                TeqipScreen(),
                TeqipScreen(),
                TeqipScreen(),
                TeqipScreen()
              ],
              controller: tabController,
            ))
          ],
        ),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "About College",
              style: uiHelpers.headline,
            ),
            centerTitle: true,
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
