import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondary,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Hello,\nMonkey D Luffy",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                )),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text(
                "Faculty",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Calendar",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.place),
              title: Text(
                "Placements",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text(
                "Student Community",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text(
                "Hall of fame",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                "My Account",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
