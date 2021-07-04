import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';

import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/main/main_viewmodel.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/drawer_item.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiHelpers = UiHelpers.fromContext(context);

    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, model, child) => SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          child: Container(
              padding: EdgeInsets.all(20.0),
              width: uiHelpers.width * 0.75,
              color: uiHelpers.backgroundColor,
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () => model.navigateToProfile(),
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          uiHelpers.scalingHelper.size(80)),
                      child:
                          (!model.isGuest && model.currentUser?.gender != null)
                              ? Image.asset(
                                  model.currentUser.gender == "Male"
                                      ? "assets/images/boy1.png"
                                      : "assets/images/girl2.png",
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50)
                              : Image.asset("assets/images/boy1.png",
                                  fit: BoxFit.cover, width: 50, height: 50),
                    ),
                    title: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: model.name ?? "Harry Potter",
                        style: uiHelpers.title
                            .apply(color: uiHelpers.textPrimaryColor),
                      ),
                      TextSpan(
                        text: "\n",
                      ),
                      TextSpan(
                        text: model.currentUser != null
                            ? model.currentUser.rollNo.toString()
                            : "",
                        style:
                            uiHelpers.body.apply(color: uiHelpers.primaryColor),
                      ),
                    ])),
                    trailing: IconButton(
                        icon: Icon(
                          backIcon,
                          color: uiHelpers.textSecondaryColor,
                        ),
                        onPressed: () {}),
                  ),
                  Divider(
                    color: uiHelpers.textSecondaryColor,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DrawerItem(
                            title: "Faculty",
                            onTap: model.navigateToStaff,
                            iconData: facultyIcon,
                          ),
                          model.isGuest
                              ? SizedBox()
                              : DrawerItem(
                                  title: "Explore Clubs",
                                  onTap: () => model.navigateToExploreClubs(),
                                  iconData: clubsIcon,
                                ),
                          model.isGuest
                              ? SizedBox()
                              : DrawerItem(
                                  title: "Timetable",
                                  onTap: () => model.navigateToTimeTable(),
                                  iconData: timeTableIcon,
                                ),
                          model.isGuest
                              ? SizedBox()
                              : DrawerItem(
                                  title: "Attendance",
                                  onTap: model.navigateToAttendance,
                                  iconData: attendanceIcon,
                                ),
                          DrawerItem(
                            title: "Campus Map",
                            onTap: model.navigateToCampusMap,
                            iconData: campusIcon,
                          ),
                          DrawerItem(
                            title: "Placements",
                            onTap: model.navigateToPlacements,
                            iconData: FlutterIcons.bar_chart_2_fea,
                          ),
                          DrawerItem(
                            title: "About College",
                            onTap: () => model.navigateToAboutCollege(),
                            iconData: schoolIcon,
                          ),
                          DrawerItem(
                            title: "About App",
                            onTap: () => model.navigateToAboutApp(),
                            iconData: infoIcon,
                          ),
                          model.isAdmin
                              ? DrawerItem(
                                  title: "Student Details",
                                  onTap: () => model.navigateToAddStudent(),
                                  iconData: FlutterIcons.users_fea,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  DrawerItem(
                    onTap: () => model.logout(),
                    title: "Logout",
                    iconData: FlutterIcons.log_out_fea,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
