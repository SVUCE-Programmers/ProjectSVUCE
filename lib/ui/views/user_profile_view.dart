import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/widgets/club_display.dart';
import 'package:svuce_app/viewmodels/userprofile_viewmodel.dart';

class UserProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<UserProfileViewModel>.withConsumer(
        viewModel: UserProfileViewModel(),
        builder: (context, model, child) => Scaffold(
          body: Container(
      child: FutureBuilder(
        future: model.getCurrentUser(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return StreamBuilder(
              stream: Firestore.instance.collection("users").where("uid",isEqualTo:snapshot.data).snapshots(),
              builder: (context, snnapshot) {
                if(snnapshot.hasData){
                  DocumentSnapshot doc=snnapshot.data.documents[0];
                  return Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xFF13273D),
          child:SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 230,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            height: 180,
                            top:0,
                            left:0,
                            right: 0,
                            child: Image.asset("assets/images/pattern.png",
                            fit: BoxFit.contain,width: MediaQuery.of(context).size.width,height: 180,),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: doc["profilePic"]==""?CircleAvatar(
                              backgroundColor: Color(0xFFCFE240),
                              radius: 50,
                              child: Text(doc["fullName"].substring(0,1),
                              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.orange),),
                            ):CachedNetworkImage(
                              imageUrl: doc["profilePic"],
                                                          
                            )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(doc["fullName"],style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color:  Color(0xFFFFFFFF)),),
                    Text(doc["rollno"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xFFCFF257)),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(left:10,right: 10),
                      child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF3C71AC)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Bio",style: TextStyle(color:Color(0xFFCFE240)),),
                              SizedBox(height: 6,),
                              doc["bio"]==""?
                              Center(child: Text("\nUser didnt entered bio",style: TextStyle(fontSize: 12,color: Colors.white.withOpacity(0.6)),)):
                              Text(doc["bio"],
                              style: TextStyle(fontSize: 12,color: Colors.white.withOpacity(0.6)),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(left:10,right: 10),
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF3C71AC)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Clubs",style: TextStyle(color:Color(0xFFCFE240)),),
                              SizedBox(height: 10,),
                              Row(
                                children: <Widget>[
                                  
                                  for (var name in doc["clubs"]) ClubWidget(name: name)
                                  
                                ],
                              )
                            ],
                          ),
                              ),         
                        ),
                    ),
                    SizedBox(height: 40,),

                  ],
                ),
          ),
  ); 
      }else{
      return Container(
  height: MediaQuery.of(context).size.height,
  color: Color(0xFF13273D),
  child: Center(
    child: Column(
      children: <Widget>[
      CircularProgressIndicator(),
      SizedBox(height: 15,),
      Text("Loading Data",style: TextStyle
      (color:Colors.white.withOpacity(0.6),fontSize: 20,
      fontWeight: FontWeight.w500 ),)
      ],
    ),
  ),
);
      }
      
    }
  );
}else{
  return Center(
    child: CircularProgressIndicator(),
  );
}
          
        }
      ),
      
    ),
        ));
  }
}
