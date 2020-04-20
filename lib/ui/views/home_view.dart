import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';
import 'package:svuce_app/ui/views/news_feed_view.dart';
import 'package:svuce_app/ui/views/user_profile_view.dart';
import 'package:svuce_app/ui/widgets/drawer.dart';
import 'package:svuce_app/ui/widgets/home_spotlight_item.dart';
import 'package:svuce_app/ui/widgets/home_wrapper.dart';
import 'package:svuce_app/viewmodels/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(),
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
  final HomeViewModel model;
  const Home({Key key, this.model}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Upcoming Events",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600,),),
            verticalSpaceMedium,
            Text("In the spotlight",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600,),),
            verticalSpaceLow,
            Container(
              height: 200,
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 4,
                children: <Widget>[
                  SpotlightItem(icon: Icons.group, name: "Clubs"),
                  SpotlightItem(icon: Icons.check_box_outline_blank, name: "Faculty"),
                  SpotlightItem(icon: Icons.settings_input_antenna, name: "Announcements"),
                  SpotlightItem(icon: Icons.timeline, name: "Time table"),
                  SpotlightItem(icon: Icons.assignment_turned_in, name: "Attendance"),
                  SpotlightItem(icon: Icons.calendar_today, name: "Calendar Events"),
                  SpotlightItem(icon: Icons.map, name: "About College"),
                  SpotlightItem(icon: Icons.account_balance, name: "About App")
                ],
              )
            )

          ],
        ),
      ),     
    );
  }
 
}