import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/drawer/drawer_view.dart';
import 'package:svuce_app/ui/widgets/home_wrapper.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<HomeViewModel>(
      viewModel: HomeViewModel(),
      builder: (context, uiHelpers, model) {
        return WillPopScope(
          onWillPop: model.onWillPop,
          child: HomeWrapper(homeItems: <Widget>[
            Container(
              color: textSecondaryColor,
              child: Center(
                child: Text("Home"),
              ),
            ),
            Container(
              color: textSecondaryColor,
              child: Center(
                child: Text("Feed"),
              ),
            ),
            Container(
              color: textSecondaryColor,
              child: Center(
                child: Text("Calendar"),
              ),
            ),
            Container(
              color: textSecondaryColor,
              child: Center(
                child: Text("Action"),
              ),
            ),
          ], drawer: DrawerView(), homeViewItems: uiHelpers.homeViewItems),
        );
      }
    );
  }
}