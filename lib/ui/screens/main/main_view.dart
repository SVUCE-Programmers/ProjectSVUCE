import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/screens/drawer/drawer_view.dart';
import 'package:svuce_app/ui/screens/main/dashboard_items.dart';
import 'package:svuce_app/ui/widgets/graph_widget.dart';

import 'main_viewmodel.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<MainViewModel>(
      viewModel: MainViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          key: model.scaffoldKey,
          appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(
                    FlutterIcons.grid_fea,
                    color: uiHelpers.textPrimaryColor,
                  ),
                  onPressed: () =>
                      model.scaffoldKey.currentState.openEndDrawer()),
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Text(
              "Home",
              style:
                  uiHelpers.title.copyWith(color: uiHelpers.textPrimaryColor),
            ),
          ),
          endDrawer: DrawerView(),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(right: 20.0),
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: model.getGreeting(),
                            style: uiHelpers.body.copyWith(fontSize: 14),
                          ),
                          TextSpan(
                            text: "\n" + model.name ?? "",
                            style: uiHelpers.body.copyWith(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: uiHelpers.textPrimaryColor),
                          )
                        ],
                      ),
                    ),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          uiHelpers.scalingHelper.size(80)),
                      child: model.userImage != null
                          ? Image.network(model.userImage,
                              fit: BoxFit.cover, width: 40, height: 40)
                          : SizedBox(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                        color: uiHelpers.surfaceColor,
                        borderRadius: BorderRadius.circular(8)),
                    height: 200,
                  ),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.only(top: 10).copyWith(right: 15),
                    title: Text(
                      "In the spotlight",
                      style: uiHelpers.title,
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.all(0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) => spotLightItems[index],
                    shrinkWrap: true,
                    primary: false,
                    itemCount: spotLightItems.length,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10)
                        .copyWith(right: 15),
                    trailing: TextButton(
                      onPressed: () => model.navigateToTimeTable(),
                      child: Text(
                        "View More",
                        style: uiHelpers.body
                            .copyWith(color: uiHelpers.primaryColor),
                      ),
                    ),
                    title: Text(
                      "Today\'s Classes",
                      style: uiHelpers.title,
                    ),
                  ),
                  ListView.builder(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Material(
                        color: uiHelpers.surfaceColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 0.3,
                        child: ListTile(
                          trailing: IconButton(
                              icon: Icon(FlutterIcons.alarm_add_mdi),
                              onPressed: () {}),
                          dense: true,
                          title: Text(
                            "9:30Am -10:30Am",
                            style: uiHelpers.body
                                .copyWith(color: uiHelpers.primaryColor),
                          ),
                          subtitle: Text(
                            "Discrete Mathematics",
                            style: uiHelpers.title,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                    ),
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                  ),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.only(bottom: 10).copyWith(right: 15),
                    trailing: TextButton(
                      onPressed: () => model.navigateToAttendance(),
                      child: Text(
                        "View More",
                        style: uiHelpers.body
                            .copyWith(color: uiHelpers.primaryColor),
                      ),
                    ),
                    title: Text(
                      "Your Attendance",
                      style: uiHelpers.title,
                    ),
                  ),
                  GraphWidget(
                    graph: model.getGraph(),
                    subjects: ["DMS", "PPS", "CTS", "NTS", "QTS"],
                    yAxis:
                        ['0', '20', '40', '60', '80', '100'].reversed.toList(),
                  ),
                  ListTile(
                    title: Text(
                      "",
                      style: uiHelpers.title,
                    ),
                  ),
                  uiHelpers.verticalSpaceMedium,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
