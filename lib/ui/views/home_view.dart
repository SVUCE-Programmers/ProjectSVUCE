import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';
import 'package:svuce_app/ui/views/news_feed_view.dart';
import 'package:svuce_app/ui/views/user_profile_view.dart';
import 'package:svuce_app/ui/widgets/drawer.dart';
import 'package:svuce_app/ui/widgets/home_wrapper.dart';
import 'package:svuce_app/ui/widgets/upcoming_item.dart';
import 'package:svuce_app/viewmodels/home_viewmodel.dart';

import '../../locator.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: locator<HomeViewModel>(),
        reuseExisting: true,
        onModelReady: (model) => model.getCurrentUserDetails(),
        builder: (context, model, child) => WillPopScope(
              onWillPop: model.onWillPop,
              child: HomeWrapper(homeItems: <Widget>[
                Container(
                  color: secondaryDark,
                  child: Home()
                ),
                NewsFeedView(),
                Container(
                  color: secondaryDark,
                  child: Center(
                    child: Text("Timetable"),
                  ),
                ),
                UserProfileView()
              ], drawer: CustomDrawer(), homeViewItems: homeViewItems),
            ));
  }
}
class Home extends StatefulWidget {  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
      onModelReady: (model)=>model.getUpcoming(),
      builder: (context, model, child)=>Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Upcoming Events",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600,),),
            verticalSpaceMedium,
            UpcomingItem(upcoming: model.upcomingevent,),
            verticalSpaceMedium,
            Text("In the spotlight",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600,),),
            verticalSpaceMedium,
            model.getGridMenu(),
          ],
        ),
      ),     
    ),
      ), 
      viewModel: HomeViewModel(),
    );
    
  }
}