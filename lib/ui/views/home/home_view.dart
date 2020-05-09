import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';

import 'home_view_items.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<HomeViewModel>(
      viewModel: HomeViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          body: Center(
            child: Text("Home"),
          ),
          bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      top: BorderSide(
                          color: textSecondaryColor,
                          style: BorderStyle.solid,
                          width: 2.0))),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: surfaceColor,
                  primaryColor: primaryColor,
                ),
                child: BottomNavigationBar(
                  items: homeViewItems.map((item) {
                    return BottomNavigationBarItem(
                        title: Text(item.title),
                        activeIcon: Icon(item.activeIcon),
                        icon: Icon(item.inactiveIcon));
                  }).toList(),
                  unselectedItemColor: textSecondaryColor,
                  selectedItemColor: primaryColor,
                ),
              )),
        );
      }
    );
  }
}