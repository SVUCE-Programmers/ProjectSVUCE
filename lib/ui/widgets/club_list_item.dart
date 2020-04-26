import 'package:flutter/material.dart';
import 'package:svuce_app/models/club.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';

class ClubTile extends StatelessWidget {
  final Club club;
  final Function onFollowButtonPressed;

  const ClubTile({Key key, this.club, this.onFollowButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondary,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(club.clubLogo),
        ),
        title: Text(club?.name),
        subtitle: Text("${club?.followers} Follower(s)"),
        isThreeLine: true,
        trailing: FlatButton.icon(
          icon: Icon(Icons.add),
          onPressed:
              onFollowButtonPressed != null ? onFollowButtonPressed : null,
          label: Text("Follow"),
        ),
      ),
    );
  }
}
