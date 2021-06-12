import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/models/club/club.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

import '../select_clubs_viewmodel.dart';

class ClubTile extends ViewModelWidget<SelectClubsViewModel> {
  final int index;
  final TextStyle headline;
  final TextStyle body;
  final bool isSelectClubs;

  ClubTile({Key key, this.index, this.headline, this.isSelectClubs, this.body});

  @override
  Widget build(BuildContext context, SelectClubsViewModel model) {
    Club club = model.clubs[index];
    bool success = model.flags[index];
    final Function onFollowButtonPressed = () => model.followClub(index);
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return Card(
      color: uiHelpers.surfaceColor,
      child: ListTile(
        leading: Hero(
          tag: "Club Logo",
          child: CircleAvatar(
            backgroundImage: NetworkImage(club.clubLogo),
          ),
        ),
        title: Text(
          club?.name,
          style: headline.copyWith(color: uiHelpers.textPrimaryColor),
        ),
        subtitle: Text(
          club?.moto,
          style: body.copyWith(color: uiHelpers.textSecondaryColor),
        ),
        trailing: isSelectClubs
            ? TextButton.icon(
                icon: Icon(addIcon),
                onPressed: onFollowButtonPressed != null
                    ? model.isBusy || success
                        ? null
                        : onFollowButtonPressed
                    : null,
                label: !model.isBusy
                    ? Text(
                        success ? "Followed" : "Follow",
                        style: TextStyle(color: uiHelpers.primaryColor),
                      )
                    : CircularProgressIndicator(),
              )
            : Icon(forwardIcon),
      ),
    );
  }
}
