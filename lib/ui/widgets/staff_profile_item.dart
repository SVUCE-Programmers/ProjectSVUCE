import 'package:flutter/material.dart';
class StaffRowItem extends StatelessWidget {
  final String title,desc;

  const StaffRowItem({Key key, @required this.title,@required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
          Text(desc,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300))
        ],
      );
  }
}