import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/home/home_viewmodel.dart';
import 'package:svuce_app/ui/views/staff/staff_view.dart';
import 'package:svuce_app/ui/widgets/drawer_item.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model)=>model.getCurrentUserDetails(),
      builder: (context, uiHelpers, model) => Drawer(
        child: Container(
            color: backgroundColor,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                  leading: CircleAvatar(
                   maxRadius: 50,
                   child: model.currentUser?.profileImg != null
                       ? Image.network(
                           model.currentUser?.profileImg,
                           fit: BoxFit.cover,
                         )
                       : SizedBox(),
                    ),
                  title: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: model.currentUser.fullName ?? "Harry Potter",
                      style: uiHelpers.body.apply(color: textPrimaryColor),
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
                        Icons.exit_to_app,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StaffView()));
                  },
                  iconData: FontAwesome5Solid.chalkboard_teacher,

                ),
                DrawerItem(
                  title: "Placements",
                  onTap: () {},
                  iconData: FontAwesome5Solid.chart_bar,
                ),
                DrawerItem(
                  title: "Calender Events",
                  onTap: () {},
                  iconData: FontAwesome5Solid.calendar,
                ),
                DrawerItem(
                  title: "Announcements",
                  onTap: () {},
                  iconData: FontAwesome5Solid.bullhorn,
                ),
                DrawerItem(
                  title: "About College",
                  onTap: () {},
                  iconData: FontAwesome5Solid.school,
                ),
                DrawerItem(
                  title: "About App",
                  onTap: () {},
                  iconData: FontAwesome5Solid.info_circle,
                ),
              ],
            )),
      ),
    );
  }
}
