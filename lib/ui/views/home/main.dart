import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/home/home_view_items.dart';

import 'main_home_viewmodel.dart';

class MainHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<MainHomeViewModel>(
      viewModel: MainHomeViewModel(),
      onModelReady: (model)=>model.getCurrentUserDetails(),
      builder: (context, uiHelpers, model)=>Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5,right: 10),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(model.getGreeting(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text("Hey "+model.currentUser.fullName,
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: model.currentUser?.profileImg != null
                        ? Image.network(
                            model.currentUser?.profileImg,
                            fit: BoxFit.cover,
                            width:40,
                            height:40
                          )
                        : SizedBox(),
                      )
                    ],
                  ),
                ),
                uiHelpers.verticalSpaceLow,
                Text("Upcoming Event",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                uiHelpers.verticalSpaceLow,
                // UpcomingItem(
                //   upcoming: model.upcomingevent,
                //   uiHelpers:uiHelpers
                // ),
                uiHelpers.verticalSpaceMedium,
                Text(
                  "In the spotlight",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                uiHelpers.verticalSpaceLow,
                Container(
                  height: 200,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: spotLightItems
                  )
                )
              ],
            ),
          ),
        ),
      )      
    );
  }
}
