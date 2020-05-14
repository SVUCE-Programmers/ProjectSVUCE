import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/calender_events/events_view.dart';
import 'package:svuce_app/ui/views/drawer/drawer_view.dart';
import 'package:svuce_app/ui/views/home/home_view_items.dart';
import 'package:svuce_app/ui/widgets/home_wrapper.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<HomeViewModel>(
        viewModel: HomeViewModel(),
        builder: (context, uiHelpers, model) {
          return WillPopScope(
            onWillPop: model.onWillPop,
            child: HomeWrapper(homeItems: <Widget>[
              Container(
                child: Center(
                  child: Text("Home"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("Feed"),
                ),
              ),
              CalendarEvents(),
              Container(
                child: Center(
                  child: Text("Action"),
                ),
              ),
            ], drawer: DrawerView(), homeViewItems: homeViewItems),
          );
        });
  }
}
