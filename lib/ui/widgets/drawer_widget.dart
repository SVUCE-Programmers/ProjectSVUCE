import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
class DrawerWidget extends StatelessWidget {
  final IconData icon;
  final String name;
  const DrawerWidget({Key key, @required this.icon, @required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:18.0),
      child: Row(
        children: <Widget>[
        Icon(icon,color: secondaryLight,),
        SizedBox(width: 6,),
        Text(name,style:TextStyle(fontSize: 14,color: secondaryLight))
      ],));
 
  }
}