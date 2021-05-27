import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';

import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/main/main_viewmodel.dart';
import 'package:svuce_app/ui/screens/placements/placements_view.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/drawer_item.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiHelpers = UiHelpers.fromContext(context);

    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      onModelReady: (model) => model.getCurrentUserDetails(),
      builder: (context, model, child) => ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        child: Container(
            padding: EdgeInsets.all(20.0),
            width: uiHelpers.width * 0.75,
            color: uiHelpers.backgroundColor,
            child: Column(
              children: <Widget>[
                ListTile(
                  // onTap: () => model.viewUserProfile(),
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                  leading: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(uiHelpers.scalingHelper.size(80)),
                    child: model.currentUser?.profileImg != null
                        ? Image.network(model.currentUser.profileImg,
                            fit: BoxFit.cover, width: 50, height: 50)
                        : SizedBox(),
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
                          ? model.currentUser.rollNo
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
                DrawerItem(
                  title: "Faculty",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlacementView()));
                  },
                  iconData: facultyIcon,
                ),
                DrawerItem(
                  title: "Explore Clubs",
                  onTap: () => model.navigateToExploreClubs(),
                  iconData: clubsIcon,
                ),
                DrawerItem(
                  title: "Timetable",
                  // onTap: () => model.viewTimeTable(),
                  iconData: timeTableIcon,
                ),
                DrawerItem(
                  title: "Attendance",
                  // onTap: () => model.viewAttendance(),
                  iconData: attendanceIcon,
                ),
                DrawerItem(
                  title: "Campus Map",
                  onTap: () {},
                  iconData: campusIcon,
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
                DrawerItem(
                  title: "Student Details",
                  onTap: () => model.navigateToAddStudent(),
                  iconData: FlutterIcons.users_fea,
                ),
                Spacer(),
                DrawerItem(
                  onTap: () => model.logout(),
                  title: "Logout",
                  iconData: FlutterIcons.log_out_fea,
                )
              ],
            )),
      ),
    );
  }
}
