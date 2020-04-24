import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/drawer_item.dart';
import 'package:svuce_app/viewmodels/home_viewmodel.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withoutConsumer(
      viewModel: locator<HomeViewModel>(),
      builder: (context, model, child) => Drawer(
        child: Container(
            color: secondaryDark,
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
                      style: buttonText.apply(color: textPrimary),
                    ),
                    newLine,
                    TextSpan(
                      text: model.currentUser.rollNo ?? "Hogwarts",
                      style: subtitle.apply(color: primary),
                    ),
                  ])),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.exit_to_app,
                        color: secondaryLight,
                      ),
                      onPressed: () {}),
                ),
                Divider(
                  color: secondaryLight,
                ),
                DrawerItem(
                  title: "Faculty",
                  onTap: () {},
                  iconData: FontAwesome5Solid.chalkboard_teacher,
                ),
                DrawerItem(
                  title: "Hall of Fame",
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
