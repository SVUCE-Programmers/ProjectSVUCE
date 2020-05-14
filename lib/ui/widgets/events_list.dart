import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/ui/views/calender_events/event_detail.dart';

class EventsList extends StatelessWidget {
  final List<dynamic> events;
  EventsList({Key key, @required this.events}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
    children: events.map((event){
     return Container(
       padding: EdgeInsets.only(bottom: 10),
       child: Container(
         padding: EdgeInsets.all(10),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Row(children: <Widget>[
               ClipRRect(
                 borderRadius: BorderRadius.circular(80),
                 child: Image.network(event.imageUrl,height: 40,width: 40,fit: BoxFit.cover,),
               ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(event.eventName,style: 
                  TextStyle(fontFamily: "Quicksand",fontSize: 20,fontWeight: FontWeight.bold,color: textPrimaryColor),),
                  SizedBox(height: 5,),
                  Text(event.place+"|"+DateTime.parse(event.timeStamp).toString(),style: 
                  TextStyle(fontFamily: "Quicksand",fontSize: 12,fontWeight: FontWeight.w200,color: textSecondaryColor),)
                ],
              ),
             ],
             ),   
             Container(
               child: IconButton(onPressed: () { 
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetails(event:event)));
                }, icon: Icon(Icons.arrow_forward_ios,size: 20,color: textPrimaryColor,),),
             )    
           ],
         )
       ),
     );
   }).toList()
 );
  }
}