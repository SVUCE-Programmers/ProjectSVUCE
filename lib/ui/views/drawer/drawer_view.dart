import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/views/home/home_viewmodel.dart';
import 'package:svuce_app/ui/views/staff/staff_view.dart';
import 'package:svuce_app/ui/widgets/drawer_item.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.getCurrentUserDetails(),
      builder: (context, uiHelpers, model) => Drawer(
        child: Container(
            color: backgroundColor,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: model.currentUser.profileImg != null
                        ? NetworkImage(
                            model.currentUser?.profileImg,
                          )
                        : SizedBox(),
                  ),
                  title: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: model.currentUser.fullName ?? "Harry Potter",
                      style: uiHelpers.title.apply(color: textPrimaryColor),
                    ),
                    TextSpan(
                      text: "\n",
                    ),
                    TextSpan(
                      text: model.currentUser.rollNo ?? "Hogwarts",
                      style: uiHelpers.body.apply(color: primaryColor),
                    ),
                  ])),
                  trailing: IconButton(
                      icon: Icon(
                        backIcon,
                        color: textSecondaryColor,
                      ),
                      onPressed: () {}),
                ),
                Divider(
                  color: textSecondaryColor,
                ),
                DrawerItem(
                  title: "Faculty",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StaffView()));
                  },
                  iconData: facultyIcon,
                ),
                DrawerItem(
                  title: "Explore Clubs",
                  onTap: () {},
                  iconData: clubsIcon,
                ),
                DrawerItem(
                  title: "Timetable",
                  onTap: () {},
                  iconData: timeTableIcon,
                ),
                DrawerItem(
                  title: "Attendance",
                  onTap: () {},
                  iconData: attendanceIcon,
                ),
                DrawerItem(
                  title: "Campus Map",
                  onTap: () {},
                  iconData: campusIcon,
                ),
                DrawerItem(
                  title: "About College",
                  onTap: () {},
                  iconData: schoolIcon,
                ),
                DrawerItem(
                  title: "About App",
                  onTap: () {},
                  iconData: infoIcon,
                ),
              ],
            )),
      ),
    );
  }
}