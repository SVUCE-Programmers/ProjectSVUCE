import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/staff_profile_item.dart';
class StaffProfile extends StatefulWidget {
  final Map data;
  StaffProfile({this.data});
  @override
  _StaffProfileState createState() => _StaffProfileState();
}

class _StaffProfileState extends State<StaffProfile> {
 
  @override
  Widget build(BuildContext context) {
    print("Got"+widget.data.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
        },),
        actions: <Widget>[
          Icon(Icons.more_vert)
        ],
        title:
         Text("Profile"),        
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50,),
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  child: CachedNetworkImage(imageUrl: widget.data["image"]),
                )
              ),
            ),
            verticalSpaceMedium,
            Text(widget.data["name"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            Text(widget.data["position"],style: TextStyle(fontSize: 14,color: primary,fontWeight: FontWeight.w300),),
            verticalSpaceHigh,
            Container(
              decoration: BoxDecoration(
                color:secondary,
                borderRadius: BorderRadius.circular(20)
              ),
              width: MediaQuery.of(context).size.width-40,
              
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Basic Information",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
                  verticalSpaceMedium,
                  StaffRowItem(title: "Email", desc: widget.data["email"]),
                  verticalSpaceLow,
                  StaffRowItem(title: "Phone", desc: widget.data["phone"]),
                  verticalSpaceLow,
                  StaffRowItem(title: "Subject", desc: widget.data["subject"]),
                  verticalSpaceLow,
                  StaffRowItem(title: "Department", desc: widget.data["dept"]),

                ],
              ),
            ),
          ],
        ),              
      ),
      
    );
  }
}