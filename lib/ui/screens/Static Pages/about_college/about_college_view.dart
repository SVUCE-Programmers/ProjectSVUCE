import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'about_college_view_model.dart';
import 'teqip_page.dart';
import 'hostel_view.dart';
import 'ncc_nss_view.dart';
import 'alumni_view.dart';
import 'library_static_view.dart';
import 'Health_center_view.dart';

class AboutCollegeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 6);
    return ScreenBuilder<AboutCollegeViewModel>(
      viewModel: AboutCollegeViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
                isScrollable: true,
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
                    icon: Text("Hostel"),
                  ),
                  Tab(
                    icon: Text("Library"),
                  ),
                  Tab(
                    icon: Text("Health Centre"),
                  ),
                  Tab(
                    icon: Text("NCC NSS"),
                  ),
                  Tab(
                    icon: Text("Alumni"),
                  )
                ]),
            Expanded(
                child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                TeqipScreen(),
                HostelView(),
                LibraryStaticView(),
                HealthCenterView(),
                NCCNSSView(),
                AlumniView()
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
