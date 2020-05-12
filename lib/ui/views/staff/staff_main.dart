import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/models/staff.dart';

class StaffMain extends StatefulWidget {
  @override
  _StaffMainState createState() => _StaffMainState();
}

class _StaffMainState extends State<StaffMain> {
  int length;
  List<Staff> s=[];
  @override
  void initState() {
    getHive();
    super.initState();
    
  }
  getApi(Box staff) async{
    JsonDecoder _decoder=new JsonDecoder();
    var url="https://firebasestorage.googleapis.com/v0/b/svuce-52b0b.appspot.com/o/staff.json?alt=media&token=0abf1cf0-27b3-4702-89a8-362333c38235";
      var res=await 
      http.get(Uri.encodeFull(url),
      headers: {"Accept":"application/json"});
      var lol=_decoder.convert(res.body);
      (lol as List).map((s){
        Staff st=Staff(
          email:s["email"],
          fullName:s["fullName"],
          avatar: s["avatar"]
        );  
        s.add(st);
        staff.add(st);
      }).toList();
  }
  getHive() async{
    final staffBox=await Hive.openBox("MainBox");
    print("StaffBox length:"+staffBox.length.toString());
    setState(() {
      length=staffBox.length;
    });
    if(length==0){
      getApi(staffBox);
    }else{
      for(int i=0;i<staffBox.length;i++) s.add(staffBox.getAt(i));
    }
  }
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        itemBuilder: (context,int index){  
        return  Container(
          padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: (){

            },
            child: Container(
              decoration: BoxDecoration(
                color: surfaceColor,
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
                      child: Image.network(s[index].avatar),
                    ),
                  ),
                  Text(s[index].fullName),
                  Text(s[index].email),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: s.length,          
      );
  }
}
