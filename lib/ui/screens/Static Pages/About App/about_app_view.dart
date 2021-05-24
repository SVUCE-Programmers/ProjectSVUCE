import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'about_app_view_model.dart';
import 'consumers/team_view_widget.dart';

class AboutAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AboutAppViewModel>(
      viewModel: AboutAppViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "About App",
              style: uiHelpers.headline,
            ),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  backIcon,
                  color: uiHelpers.textPrimaryColor,
                ),
                onPressed: model.navigateBack)),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  horizontalTitleGap: 0.0,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  subtitle: Container(
                    margin: EdgeInsets.only(right: uiHelpers.width - 220),
                    width: 150,
                    child: Divider(
                      color: uiHelpers.dividerColor,
                      thickness: 2,
                    ),
                  ),
                  title: Text(
                    "Developement Team",
                    style: uiHelpers.title,
                  ),
                ),
                Center(
                  child: TeamViewWidget(
                    data: model.hkData,
                  ),
                ),
                uiHelpers.verticalSpaceLow,
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.25, crossAxisCount: 2),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => TeamViewWidget(
                    data: model.teamList[index],
                    radius: 60,
                  ),
                  itemCount: model.teamList.length,
                ),
                ListTile(
                  horizontalTitleGap: 0.0,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  subtitle: Container(
                    margin: EdgeInsets.only(right: uiHelpers.width - 200),
                    width: 150,
                    child: Divider(
                      color: uiHelpers.dividerColor,
                      thickness: 2,
                    ),
                  ),
                  title: Text(
                    "Technologies Used",
                    style: uiHelpers.title,
                  ),
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (model.technologiesList.values.elementAt(index) is String)
                          ? Image.network(
                              model.technologiesList.values.elementAt(index),
                              height: 80,
                            )
                          : model.technologiesList.values.elementAt(index),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${model.technologiesList.keys.elementAt(index)}",
                        style: uiHelpers.title,
                      )
                    ],
                  ),
                  itemCount: model.technologiesList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
