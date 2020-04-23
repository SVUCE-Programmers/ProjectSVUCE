import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/models/upcoming.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';

class UpcomingItem extends StatelessWidget {
  final Upcoming upcoming;
  const UpcomingItem({Key key, this.upcoming}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 12,right: 12),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: secondaryLight,
            ),
            child: CachedNetworkImage(imageUrl: upcoming.imageUrl,fit: BoxFit.cover,)
          ),
          verticalSpaceLow,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(upcoming.eventName,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                  Text(upcoming.timeStamp+" | "+upcoming.place,
                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: secondary),)
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: secondaryLight,
                ),
              )
            ],
          ),
          verticalSpaceLow,
          Divider(height: 6,color: Colors.white,),
        ],
      ),
    );                
  }
}