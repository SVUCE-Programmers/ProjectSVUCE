import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/services/dbservice.dart';
import 'package:svuce_app/services/staff_provider.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
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
        return First();
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
                       return InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>StaffProfile(data:hmm.data)));
                         },
                         child: Container(
                           height: 150,
                           child: Card(
                             color: secondary,
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
                                   Text("${hmm['name']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                                   SizedBox(height:3),
                                   Text("${hmm['subject']}",style: TextStyle(fontWeight: FontWeight.w300,color: primary,fontSize: 14),),
                                 ],

                               ),
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
class First extends StatefulWidget {
  const First({Key key}) : super(key: key);

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildEmployeeListView(),
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = EmployeeApiProvider();
    await apiProvider.getAllEmployees();

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  // _deleteData() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   await DBProvider.db.deleteAllEmployees();
  //   await Future.delayed(const Duration(seconds: 1));
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  _buildEmployeeListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllEmployees(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (!snapshot.hasData) {
          // _loadFromApi();
          return Center(child:CircularProgressIndicator());
        } else {
          if(snapshot.data==[]) {
            _loadFromApi();
            return _loadFromDb(snapshot);
          }else{
            return _loadFromDb(snapshot);
          }
          
        }
      },
    );
  }
  _loadFromDb(AsyncSnapshot snapshot){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        itemBuilder: (BuildContext context,int index){  
        return  Container(
          
          padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: (){

            },
            child: Container(
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 150,
              padding: EdgeInsets.all(4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CircleAvatar(
                      radius: 40,
                      child: CachedNetworkImage(imageUrl:snapshot.data[index].avatar),
                    ),
                  ),
                  Text(snapshot.data[index].firstName),
                  Text(snapshot.data[index].lastName),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: snapshot.data.length,          
      );
  }
}