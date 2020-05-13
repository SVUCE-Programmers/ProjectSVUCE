import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/staff/staff_view_model.dart';

class StaffMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<StaffViewModel>(
      viewModel: StaffViewModel(),
      onModelReady: (model)=>model.getStaff(),
      builder: (context, uiHelpers, model) =>Scaffold(
        body: model.staffList!=null?
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
          ), 
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius:BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(model.staffList[index].avatar,height: 80,width: 80,fit: BoxFit.cover,),
                    ),
                    uiHelpers.verticalSpaceLow,
                    Text(model.staffList[index].fullName,style: TextStyle(
                      color: Colors.white,fontFamily: "Quicksand",fontSize: 20,fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            );
          },
          itemCount:model.staffList.length ,
        ):Center(
          child:CircularProgressIndicator(),
        ),
      )
    );
  }
}