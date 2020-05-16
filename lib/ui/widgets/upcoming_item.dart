import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/models/event.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';
class UpcomingItem extends StatelessWidget {
  final Event upcoming;
  final UIHelpers uiHelpers;
  const UpcomingItem({Key key, this.upcoming,this.uiHelpers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("At Upcoming item:"+upcoming.toString());
    return  Container(
      padding: EdgeInsets.only(left: 12,right: 12),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: surfaceColor,
            ),
            child: Image.network(upcoming.imageUrl,fit: BoxFit.cover,)
          ),
          uiHelpers.verticalSpaceLow,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(upcoming.eventName,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                  Text(upcoming.timeStamp+" | "+upcoming.place,
                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: textSecondaryColor),)
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: surfaceColor,
                ),
              )
            ],
          ),
          uiHelpers.verticalSpaceLow,
          Divider(height: 6,color: Colors.white,),
        ],
      ),
    );                
  }
}