import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';
import 'package:svuce_app/ui/views/staff_view.dart';
import 'package:svuce_app/ui/widgets/drawer_widget.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width/2+60,
      color: secondaryDark,
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              children: <Widget>[
                Image.asset("assets/illustrations/pattern.png",
                  fit: BoxFit.contain,height: 180,width: MediaQuery.of(context).size.width/2+60,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor: secondary,
                      radius: 40,
                    ),
                  ),
              ],
            ),
          ),
          verticalSpaceLow,
          Text("Luffy",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
          Text("11706004",style: TextStyle(fontSize: 14,color: primary,fontWeight: FontWeight.w300),),
          verticalSpaceLow,
          Container(
            width: MediaQuery.of(context).size.width/2-50,
            height: 40,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(14)
            ),
            child: FlatButton(onPressed: (){}, child: Row(
              children: <Widget>[
                Icon(Icons.exit_to_app,size: 16,),
                SizedBox(width: 4,),
                Text("Sign Out",style: TextStyle(fontSize:12),)
              ],)),
          ),
          verticalSpaceHigh,
          GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Staff())),
            child: DrawerWidget(icon: Icons.supervised_user_circle,name: "Staff",)
          ),
          verticalSpaceLow,
          DrawerWidget(icon: Icons.supervised_user_circle,name: "Explore Clubs",),
          verticalSpaceLow,
          DrawerWidget(icon: Icons.supervised_user_circle,name: "Explore Clubs",),
          verticalSpaceLow,
          DrawerWidget(icon: Icons.supervised_user_circle,name: "Explore Clubs",),
          verticalSpaceLow,
          DrawerWidget(icon: Icons.supervised_user_circle,name: "Explore Clubs",),

          
        ],
      )
    );
  }
 
}
