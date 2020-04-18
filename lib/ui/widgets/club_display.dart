import 'package:flutter/material.dart';
class ClubWidget extends StatefulWidget {
  String name;
  String image;
  ClubWidget({@required this.name, this.image});

  @override
  _ClubWidgetState createState() => _ClubWidgetState(name,image);
}

class _ClubWidgetState extends State<ClubWidget> {
  String name,image;
  _ClubWidgetState(this.name,this.image);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left:10.0,right:10),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(height: 5,),
            Container(width: 40,child: Center(
              child: Text(name,
              style: TextStyle(fontSize: 10,
              fontWeight: FontWeight.w600,color: Colors.white.withOpacity(0.7)),),
            )),
          ],
        ),
      ),
      
    );
  }
}