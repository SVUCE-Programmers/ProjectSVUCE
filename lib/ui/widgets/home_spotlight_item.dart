import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';

class SpotlightItem extends StatelessWidget {
  final IconData icon;
  final String name;
  const SpotlightItem({Key key, @required this.icon, @required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CircleAvatar(
                  backgroundColor: secondaryLight,
                  child: Icon(icon,color: primary,size: 26,),
                ),
              ),
              verticalSpaceLow,
              Container(width:50,child: Text(name,style: TextStyle(fontSize: 10),)),
            ],
          ),
        );
  }
}