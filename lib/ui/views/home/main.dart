import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/home/home_view_items.dart';

import 'main_home_viewmodel.dart';

class MainHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<MainHomeViewModel>(
      viewModel: MainHomeViewModel(),
      onModelReady: (model) => model.getCurrentUserDetails(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(0.0),
              title: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: model.getGreeting(),
                      style: uiHelpers.title,
                    ),
                    TextSpan(
                      text: "\nHey " + model.currentUser.fullName,
                      style: uiHelpers.body
                          .copyWith(fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              trailing: ClipRRect(
                borderRadius:
                    BorderRadius.circular(uiHelpers.scalingHelper.size(80)),
                child: model.currentUser?.profileImg != null
                    ? Image.network(model.currentUser.profileImg,
                        fit: BoxFit.cover, width: 40, height: 40)
                    : SizedBox(),
              ),
            ),
            uiHelpers.verticalSpaceMedium,
            Text("Upcoming Event",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            uiHelpers.verticalSpaceMedium,
            Text(
              "In the spotlight",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            uiHelpers.verticalSpaceLow,
            Wrap(
              children: firstRowSpotlight.map((eachSpotLight) {
                if (eachSpotLight.name == "Explore Clubs") {
                  return GestureDetector(
                    onTap: () => model.gotoClubs(),
                    child: eachSpotLight,
                  );
                } else {
                  return eachSpotLight;
                }
              }).toList(),
              alignment: WrapAlignment.spaceBetween,
            ),
            uiHelpers.verticalSpaceMedium,
            Wrap(
              children: secondRowSpotlight,
              alignment: WrapAlignment.spaceBetween,
            ),
          ],
        ),
      ),
    );
  }
}
