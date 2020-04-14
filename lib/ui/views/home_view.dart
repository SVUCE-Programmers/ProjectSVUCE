import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
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
              child: HomeWrapper(
                appBarIcon: Feather.grid,
                appBarTitle: "Home",
                body: Container(
                  color: secondaryDark,
                  alignment: Alignment.center,
                  child: Text("Home"),
                ),
                drawer: Container(
                  color: primary,
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: () {},
                  ),
                ),
                bottomNav: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                          top: BorderSide(
                              color: secondaryLight,
                              style: BorderStyle.solid,
                              width: 2.0))),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: secondaryDark,
                      primaryColor: primary,
                    ),
                    child: BottomNavigationBar(
                      currentIndex: 2,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Feather.home), title: Text("Home")),
                        BottomNavigationBarItem(
                            icon: Icon(Feather.calendar),
                            title: Text("Events")),
                        BottomNavigationBarItem(
                            icon: Icon(Feather.bell),
                            title: Text("Notifications")),
                        BottomNavigationBarItem(
                            icon: Icon(Feather.user), title: Text("Profile")),
                      ],
                      unselectedItemColor: secondaryLight,
                      selectedItemColor: primary,
                    ),
                  ),
                ),
              ),
            ));
  }
}
