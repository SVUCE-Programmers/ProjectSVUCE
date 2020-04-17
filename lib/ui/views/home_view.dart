import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/views/news_feed_view.dart';
import 'package:svuce_app/ui/views/user_profile_view.dart';
import 'package:svuce_app/ui/widgets/drawer.dart';
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
                  child: Center(
                    child: Text("Home"),
                  ),
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
