import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';

class ProfileClubItem extends StatelessWidget {
  final String clubName, clubIcon;

  const ProfileClubItem({Key key, this.clubName, this.clubIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            verticalSpaceMedium,
            Container(
                width: 40,
                child: Center(
                  child: Text(
                    clubName,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.7)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
