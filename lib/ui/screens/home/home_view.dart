import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/screens/home/home_viewmodel.dart';

import 'home_view_items.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.getCurrentUserDetails(),
      builder: (context, uiHelpers, model) => WillPopScope(
        onWillPop: model.showExitSnackbar,
        child: Scaffold(
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
                        text: "\n" + model.currentUser.fullName,
                        style: uiHelpers.body.copyWith(
                            fontWeight: FontWeight.w600,
                            color: uiHelpers.textSecondaryColor),
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
              Text("\nUpcoming Event\n",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              Container(
                height: uiHelpers.blockSizeVertical * 20,
                decoration: BoxDecoration(
                    color: uiHelpers.surfaceColor,
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              Text(
                "\nIn the spotlight\n",
                style: uiHelpers.title,
              ),
              Wrap(
                children: firstRowSpotlight.map((eachSpotLight) {
                  if (eachSpotLight.name == "Explore Clubs") {
                    return GestureDetector(
                      onTap: () => model.exploreClubs(),
                      child: eachSpotLight,
                    );
                  } else {
                    return eachSpotLight;
                  }
                }).toList(),
                alignment: WrapAlignment.spaceBetween,
              ),
              uiHelpers.verticalSpaceLow,
              Wrap(
                children: secondRowSpotlight,
                alignment: WrapAlignment.spaceBetween,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
