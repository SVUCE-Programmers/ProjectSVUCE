import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/models/user_club/user_club.dart';

import 'user_profile_viewmodel.dart';

class UserProfileView extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<UserProfileViewModel>(
      viewModel: UserProfileViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, uiHelpers, model) {
        final newLine = TextSpan(text: "\n");

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Profile",
              style: uiHelpers.headline,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: model.goBack,
                icon: Icon(backIcon, color: uiHelpers.textPrimaryColor)),
          ),
          body: model.user == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: <Widget>[
                    uiHelpers.verticalSpaceHigh,
                    Container(
                        height: uiHelpers.blockSizeVertical * 15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: model.user == null ||
                                        model.user.gender == "Male"
                                    ? AssetImage("assets/images/boy1.png")
                                    : AssetImage("assets/images/girl2.png")))),
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
                          text: model.user.rollNo.toString(),
                          style: uiHelpers.body
                              .apply(color: uiHelpers.primaryColor),
                        ),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    uiHelpers.verticalSpaceMedium,
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
                            style: uiHelpers.title
                                .apply(color: uiHelpers.primaryColor),
                          ),
                          uiHelpers.verticalSpaceLow,
                          model.hasUserClubs
                              ? Wrap(
                                  children: model.hasUserClubs
                                      ? model.userClubs
                                          .map((userClub) =>
                                              userClubItem(userClub))
                                          .toList()
                                      : [],
                                )
                              : Text(
                                  "Register to clubs to get to know live events."),
                        ],
                      ),
                    ),
                    uiHelpers.verticalSpaceMedium,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: uiHelpers.surfaceColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Details",
                            style: uiHelpers.title
                                .apply(color: uiHelpers.primaryColor),
                          ),
                          uiHelpers.verticalSpaceLow,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Email: ",
                                  style: uiHelpers.title,
                                  textAlign: TextAlign.start,
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  model.user.email,
                                  style: uiHelpers.body,
                                  textAlign: TextAlign.start,
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                          uiHelpers.verticalSpaceLow,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Phone Number: ",
                                  style: uiHelpers.title,
                                  textAlign: TextAlign.start,
                                ),
                                flex: 4,
                              ),
                              Expanded(
                                child: Text(
                                  model.user.phoneNumber?.toString(),
                                  style: uiHelpers.body,
                                  textAlign: TextAlign.start,
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                          uiHelpers.verticalSpaceLow,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Roll Number: ",
                                  style: uiHelpers.title,
                                  textAlign: TextAlign.start,
                                ),
                                flex: 4,
                              ),
                              Expanded(
                                child: Text(
                                  model.user.rollNo.toString(),
                                  style: uiHelpers.body,
                                  textAlign: TextAlign.start,
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                          uiHelpers.verticalSpaceLow,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Gender: ",
                                  style: uiHelpers.title,
                                  textAlign: TextAlign.start,
                                ),
                                flex: 4,
                              ),
                              Expanded(
                                child: Text(
                                  model.user.gender.toString(),
                                  style: uiHelpers.body,
                                  textAlign: TextAlign.start,
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                          uiHelpers.verticalSpaceLow,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "College Name: ",
                                  style: uiHelpers.title,
                                  textAlign: TextAlign.start,
                                ),
                                flex: 4,
                              ),
                              Expanded(
                                child: Text(
                                  model.user.collegeName.toString(),
                                  style: uiHelpers.body,
                                  textAlign: TextAlign.start,
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    uiHelpers.verticalSpaceMedium,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Follow us on:",
                        style: uiHelpers.title
                            .apply(color: uiHelpers.primaryColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0)
                          .copyWith(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            model.socialLinksData.length,
                            (index) => IconButton(
                                  icon: Icon(
                                      model.socialLinksData[index]["icon"],
                                      size: 24,
                                      color: model.socialLinksData[index]
                                          ["color"]),
                                  onPressed: () {},
                                )),
                      ),
                    ),
                    uiHelpers.verticalSpaceHigh,
                  ],
                ),
        );
      },
    );
  }
}
