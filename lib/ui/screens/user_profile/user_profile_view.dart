import 'package:flutter/material.dart';
import 'package:svuce_app/app/assets.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/core/models/user_club/user_club.dart';

import 'user_profile_viewmodel.dart';

class UserProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<UserProfileViewModel>(
      viewModel: UserProfileViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, uiHelpers, model) {
        final radius = uiHelpers.blockSizeVertical * 10;

        final newLine = TextSpan(text: "\n");

        return Scaffold(
          body: ListView(
            children: <Widget>[
              Container(
                height: uiHelpers.blockSizeVertical * 40,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        asteroidPattern,
                        fit: BoxFit.cover,
                        width: uiHelpers.width,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: uiHelpers.blockSizeHorizontal * 50 - radius,
                        child: CircleAvatar(
                          radius: radius,
                          backgroundColor: uiHelpers.textSecondaryColor,
                          backgroundImage: model.user.profileImg == null
                              ? null
                              : NetworkImage(
                                  model.user.profileImg,
                                ),
                          child: model.user.profileImg != null
                              ? null
                              : Text(
                                  model.user.fullName[0],
                                  style: TextStyle(
                                      fontSize:
                                          uiHelpers.blockSizeHorizontal * 20),
                                ),
                        ))
                  ],
                ),
              ),
              uiHelpers.verticalSpaceLow,
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: model.user.fullName,
                    style: uiHelpers.title
                        .apply(color: uiHelpers.textPrimaryColor),
                  ),
                  newLine,
                  TextSpan(
                    text: model.user.rollNo,
                    style: uiHelpers.body.apply(color: uiHelpers.primaryColor),
                  ),
                ]),
                textAlign: TextAlign.center,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: uiHelpers.surfaceColor),
                child: ListTile(
                  title: Text(
                    "Bio",
                    style: uiHelpers.title.apply(color: uiHelpers.primaryColor),
                  ),
                  subtitle: Text(model.user.bio,
                      style: uiHelpers.body
                          .apply(color: uiHelpers.textPrimaryColor)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: uiHelpers.surfaceColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Clubs",
                      style:
                          uiHelpers.title.apply(color: uiHelpers.primaryColor),
                    ),
                    uiHelpers.verticalSpaceLow,
                    Wrap(
                      children: model.hasUserClubs
                          ? model.userClubs
                              .map((userClub) => userClubItem(userClub))
                              .toList()
                          : [],
                    )
                  ],
                ),
              ),
              uiHelpers.verticalSpaceMedium
            ],
          ),
        );
      },
    );
  }

  Widget userClubItem(UserClub userClub) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: userClub.clubLogo != null
              ? Image.network(userClub.clubLogo,
                  fit: BoxFit.cover, width: 40, height: 40)
              : SizedBox(),
        ),
        Text.rich(TextSpan(children: [
          TextSpan(text: "\n"),
          TextSpan(text: userClub.name),
        ]))
      ],
    );
  }
}
