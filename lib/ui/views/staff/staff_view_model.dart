import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/models/staff.dart';
import 'package:http/http.dart' as http;


class StaffViewModel extends BaseViewModel{

  int length;
  List<Staff> _staffList=List<Staff>();
  List<Staff> get staffList=>_staffList;

  getStaff() async{
    setBusy(true);
    _staffList=await getHive();
    setBusy(false);
  }
  Future<List<Staff>> getHive() async{
    print("Entered getHive");
    final staffBox=await Hive.openBox("MainBox");
    print("StaffBox length:"+staffBox.length.toString());
    length=staffBox.length;
    if(length==0){
      JsonDecoder _decoder=new JsonDecoder();
       var url=
      "https://firebasestorage.googleapis.com/v0/b/svuce-52b0b.appspot.com/o/staff.json?alt=media&token=0abf1cf0-27b3-4702-89a8-362333c38235";
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
          staffBox.add(st);
        }).toList();
        for(int i=0;i<staffBox.length;i++) _staffList.add(staffBox.getAt(i));
        print("Returning stafflist at getApi:"+_staffList.toString());
        return _staffList;
    }else{
      for(int i=0;i<staffBox.length;i++) print("Hmm"+staffBox.getAt(i).toString());
      for(int i=0;i<staffBox.length;i++) _staffList.add(staffBox.getAt(i));
      print("Returning stafflist at getHive:"+_staffList.toString());
      return _staffList;
    }
  }
}