import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:svuce_app/constants/assets.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';
import 'package:svuce_app/viewmodels/home_viewmodel.dart';

class UserProfileView extends ProviderWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
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
                    pattern,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: secondary,
                      backgroundImage: NetworkImage(
                        model.currentUser.profileImg,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            model.currentUser.fullName,
            style: subhead.apply(color: textPrimary),
          ),
          Text(
            model.currentUser.rollNo,
            style: bodyText.apply(color: primary),
          ),
          verticalSpaceHigh,
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryLight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bio",
                    style: buttonText.copyWith(color: primary),
                  ),
                  verticalSpaceLow
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
          verticalSpaceMedium,
          Container(
            height: 150,
            margin: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: secondaryLight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Clubs",
                  style: buttonText.copyWith(color: primary),
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
          verticalSpaceHigh
        ],
      ),
    );
  }
}
