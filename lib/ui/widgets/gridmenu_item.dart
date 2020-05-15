import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';

class SpotlightItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function onTap;
  const SpotlightItem({Key key, @required this.icon, 
      @required this.name,@required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: surfaceColor.withOpacity(0.4)
            ),
            child:  Icon(icon,color: primaryColor,size: 26,),
            
          ),
          Container(width:50,child: Center(child: Text(name,style: TextStyle(fontSize: 10),))),
        ],
      ),
    );
  }
}