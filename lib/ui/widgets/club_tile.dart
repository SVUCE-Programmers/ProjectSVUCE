import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/models/club.dart';
import 'package:svuce_app/ui/views/select_clubs/select_clubs_viewmodel.dart';

class ClubTile extends ViewModelWidget<SelectClubsViewModel> {
  final int index;
  final TextStyle headline;

  ClubTile({Key key, this.index, this.headline});

  @override
  Widget build(BuildContext context, SelectClubsViewModel model) {
    Club club = model.clubs[index];
    bool success = model.flags[index];
    final Function onFollowButtonPressed = () => model.followClub(index);

    return Card(
      color: surfaceColor,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(club.clubLogo),
        ),
        title: Text(
          club?.name,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: textPrimaryColor),
        ),
        subtitle: Text(
          club?.moto,
          style: Theme.of(context)
              .textTheme.headline6
              .copyWith(color: textSecondaryColor),
        ),
        trailing: FlatButton.icon(
          textColor: primaryColor,
          icon: Icon(Icons.add),
          onPressed: onFollowButtonPressed != null
              ? model.isBusy || success ? null : onFollowButtonPressed
              : null,
          label: !model.isBusy
              ? Text(success ? "Followed" : "Follow")
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
