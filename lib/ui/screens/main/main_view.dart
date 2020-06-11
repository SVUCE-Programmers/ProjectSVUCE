import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/action_center/action_center_view.dart';
import 'package:svuce_app/ui/screens/calender_events/events_view.dart';
import 'package:svuce_app/ui/screens/feed/feed_view.dart';
import 'package:svuce_app/ui/screens/home/home_view.dart';
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
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(feedIcon),
                  title: Text("Feed"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(eventsIcon),
                  title: Text("Events"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(actionCenterIcon),
                  title: Text("Action Center"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
