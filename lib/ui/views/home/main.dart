import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
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
                      text: "\n" + model.currentUser.fullName,
                      style: uiHelpers.body.copyWith(
                          fontWeight: FontWeight.w600,
                          color: textSecondaryColor),
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
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Text(
              "\nIn the spotlight\n",
              style: uiHelpers.title,
            ),
            Wrap(
              children: firstRowSpotlight,
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
    );
  }
}
