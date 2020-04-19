import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class StaffProfile extends StatefulWidget {
  final String uid;
  StaffProfile({this.uid});
  @override
  _StaffProfileState createState() => _StaffProfileState(uid);
}

class _StaffProfileState extends State<StaffProfile> {
  String uid;
  _StaffProfileState(this.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: StreamBuilder(
        stream: Firestore.instance.collection('staff').where("uid",isEqualTo: uid).snapshots(),
        builder: (context, snapshot) {
          DocumentSnapshot hm=snapshot.data.documents[0];
          //print("Snapshot is"+hm.data.toString());
          return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: <Widget>[
                            Hero(
                              tag: "StaffImage",
                              child: CircleAvatar(
                                radius: 80,
                                child: CachedNetworkImage(imageUrl: "${hm["image"]}"),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            SizedBox(height: 30,),
                            Text("${hm["name"]}",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w600
                              ),),
                            SizedBox(height: 6,),
                            Text("${hm["position"]}",style: TextStyle(),),
                            SizedBox(height: 10,),

                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Icon(Icons.message),
                          SizedBox(width: 20,),
                          Icon(Icons.phone,),
                          SizedBox(width: 20,),
                          Icon(Icons.email),
                        ],
                      ),
                      SizedBox(height:20),
                      Text("Basic Information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      Padding(
                        padding: EdgeInsets.only(left:5, top:5, right:5, bottom:5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left:10.0,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Study",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                                Text("ph D"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6,),
                      Padding(
                        padding: EdgeInsets.only(left:5, top:5, right:5, bottom:5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left:10.0,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Email",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                                Text("${hm["email"]}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6,),
                        Padding(
                        padding: EdgeInsets.only(left:5, top:5, right:5, bottom:5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left:10.0,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Phone",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                                Text("${hm["phone"]}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6,),
                        Padding(
                        padding: EdgeInsets.only(left:5, top:5, right:5, bottom:5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left:10.0,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Department",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                                Text("Cse"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                    ],
            ),
                  ),
                ),
              ),
          );
        }
      ),
      
    );
  }
}