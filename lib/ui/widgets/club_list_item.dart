import 'package:flutter/material.dart';
import 'package:svuce_app/models/club.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';

class ClubTile extends StatelessWidget {
  final Club club;
  final bool isBusy, success;
  final Function onFollowButtonPressed;

  const ClubTile(
      {Key key,
      this.club,
      this.onFollowButtonPressed,
      this.isBusy,
      this.success})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: revampSurface,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(club.clubLogo),
        ),
        title: Text(
          club?.name,
          style: Theme.of(context).textTheme.title.copyWith(color: textPrimary),
        ),
        subtitle: Text(
          club?.moto,
          style: Theme.of(context)
              .textTheme
              .subhead
              .copyWith(color: revampSecondary),
        ),
        trailing: FlatButton.icon(
          textColor: revampMajor,
          icon: Icon(Icons.add),
          onPressed: onFollowButtonPressed != null
              ? isBusy || success ? null : onFollowButtonPressed
              : null,
          label: !isBusy
              ? Text(success ? "Followed" : "Follow")
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
