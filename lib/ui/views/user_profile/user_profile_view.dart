import 'package:flutter/material.dart';
import 'package:svuce_app/app/assets.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';

import 'user_profile_viewmodel.dart';

class UserProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<UserProfileViewModel>(
      viewModel: UserProfileViewModel(),
      builder: (context, uiHelpers, model) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 230,
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
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: textSecondaryColor,
                          backgroundImage: NetworkImage(
                            "https://user-images.githubusercontent.com/21126965/79110772-c6adc780-7d98-11ea-8dc5-f289b90d7656.png",
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "model.currentUser.fullName",
                style: uiHelpers.title.apply(color: textPrimaryColor),
              ),
              Text(
                "model.currentUser.rollNo",
                style: uiHelpers.body.apply(color: primaryColor),
              ),
              uiHelpers.verticalSpaceHigh,
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: surfaceColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Bio",
                        style: uiHelpers.title.apply(color: primaryColor),
                      ),
                      // doc["bio"] == ""
                      //     ? Center(
                      //         child: Text(
                      //         "\nUser didnt entered bio",
                      //         style: TextStyle(
                      //             fontSize: 12,
                      //             color: Colors.white.withOpacity(0.6)),
                      //       ))
                      //     : Text(
                      //         doc["bio"],
                      //         style: TextStyle(
                      //             fontSize: 12,
                      //             color: Colors.white.withOpacity(0.6)),
                      //       ),
                    ],
                  ),
                ),
              ),
              uiHelpers.verticalSpaceMedium,
              Container(
                height: 150,
                margin: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: surfaceColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Clubs",
                      style: uiHelpers.title.apply(color: primaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     for (var name in doc["clubs"]) ClubWidget(name: name)
                    //   ],
                    // )
                  ],
                ),
              ),
              uiHelpers.verticalSpaceHigh
            ],
          ),
        );
      },
    );
  }
}
