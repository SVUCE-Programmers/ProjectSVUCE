import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/screens/action_center/action_center_view.dart';
import 'package:svuce_app/ui/screens/calender_events/events_view.dart';
import 'package:svuce_app/ui/screens/drawer/drawer_view.dart';
import 'package:svuce_app/ui/screens/feed/feed_view.dart';
import 'package:svuce_app/ui/screens/home/home_view.dart';
import 'package:svuce_app/ui/screens/home/home_view_items.dart';
import 'package:svuce_app/ui/widgets/lazy_indexed_stack.dart';

import 'main_viewmodel.dart';

class MainView extends StatelessWidget {
  final _views = [
    HomeView(),
    FeedView(),
    CalenderEventsView(),
    ActionCenter(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<MainViewModel>(
      viewModel: MainViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Text(
              homeViewItems[model.index].title,
              style: uiHelpers.title.copyWith(color: textPrimaryColor),
            ),
          ),
          endDrawer: DrawerView(),
          body: LazyIndexedStack(
            reuse: true,
            index: model.index,
            itemCount: _views.length,
            itemBuilder: (_, index) => _views[index],
          ),
          bottomNavigationBar: Theme(
              data: ThemeData(canvasColor: surfaceColor),
              child: BottomNavigationBar(
                fixedColor: primaryColor,
                unselectedItemColor: textSecondaryColor,
                currentIndex: model.index,
                onTap: model.changeTab,
                items: homeViewItems
                    .map(
                      (homeViewItem) => BottomNavigationBarItem(
                        activeIcon: Icon(homeViewItem.activeIcon),
                        icon: Icon(homeViewItem.inactiveIcon),
                        title: Text(homeViewItem.title),
                      ),
                    )
                    .toList(),
              )),
        );
      },
    );
  }
}
