import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/views/staff_profile.dart';
class StaffTabs extends StatefulWidget {
  final String category;
   StaffTabs({this.category});
  @override
  _StaffTabsState createState() => _StaffTabsState(category);
}

class _StaffTabsState extends State<StaffTabs> {
  String category;
  _StaffTabsState(this.category);
  @override
  Widget build(BuildContext context) {
    switch(category){
      case "Main":
        return first();
      case "Department":
        return dept();
      case "Assistants":
        return assistants();
        
    }
    return Center(
          child:CircularProgressIndicator()
    );
    
  }
  Widget assistants(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ex("Teaching Assistant"),
            SizedBox(height: 10,),
            ex("Lab Assistant"),
             SizedBox(height: 10,),
            ex("Office Staff"),
          ],
        )
      ),
    );
  }  
  Widget first(){
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection("staff").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              
              return GridView.builder(
                
                gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot hmpost=snapshot.data.documents[index];
              return  Column(children: <Widget>[
            InkWell(
              splashColor: Colors.grey,
              onTap: (){ 
                Navigator.push(context, MaterialPageRoute(builder: (conttext)=>StaffProfile(uid:hmpost["uid"])));
              },
              child: Center(
                child: Container(
                  height: 170,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.2)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0,top: 20,right: 8,bottom: 10),
                  child: Column(
                    children: <Widget>[
                        CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,  
                        child: CachedNetworkImage(imageUrl: hmpost["image"],fit: BoxFit.cover,),
                      ),
                      SizedBox(height: 10,),
                      Text("${hmpost['name']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      SizedBox(height:3),
                      Text("${hmpost['position']}",style: TextStyle(fontWeight: FontWeight.w300),),
                    ],
                  ),
                ),
            ),
              ),
          ),
          ],);
          },
          itemCount: snapshot.data.documents.length,          
          );
            } 
        }
      ),
    );
  }
  Widget dept(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ex("Cse"),
            SizedBox(height: 10,),
            ex("Ece"),
             SizedBox(height: 10,),
            ex("Civil"),
             SizedBox(height: 10,),
            ex("Mech"),
             SizedBox(height: 10,),
            ex("EEE"),
             SizedBox(height: 10,),
            ex("Che"),
          ],
        )
      ),
    );
  }
  Widget ex(String dept){
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(dept),
            SizedBox(height: 10,),
            Container(
              height: 150,
              child: StreamBuilder(
                stream: Firestore.instance.collection("dept").where("dept",isEqualTo: dept).snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return LinearProgressIndicator();
                  }else{
                    return ListView.builder( 
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.documents.length,                  
                    itemBuilder: (context,index){
                      DocumentSnapshot hmm=snapshot.data.documents[index];  
                      print(hmm);
                      return Container(
                        height: 150,
                        child: Card(
                          elevation: 4.0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,  
                                  child: CachedNetworkImage(imageUrl: hmm["image"],fit: BoxFit.cover,),
                                ),
                                SizedBox(height: 10,),
                                Text("${hmm['name']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                SizedBox(height:3),
                                Text("${hmm['subject']}",style: TextStyle(fontWeight: FontWeight.w300),),
                              ],

                            ),
                          ),                      
                        ),
                      );                  
                    }
                  );
                  }
                  
                }
              ),
            ),
          ],
        );
  }
}