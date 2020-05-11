import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/models/home_view_item.dart';
import 'package:svuce_app/ui/widgets/bottom_navigation.dart';

class HomeWrapper extends StatefulWidget {
  final Widget drawer;
  final List<HomeViewItem> homeViewItems;
  final List<Widget> homeItems;

  const HomeWrapper({Key key, this.drawer, this.homeItems, this.homeViewItems})
      : super(key: key);
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int currentIndex = 0;
  final List<BarItem> barItems = [
    BarItem(text: "Home", iconData: homeIcon, width: 105),
    BarItem(text: "Feed", iconData: feedIcon, width: 105),
    BarItem(text: "Calendar", iconData: timeTableIcon, width: 120),
    BarItem(text: "Actions", iconData: actionCenterIcon, width: 110),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Text(
            widget.homeViewItems[currentIndex].title,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  EvaIcons.bell,
                  color: primaryColor,
                ),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => NotificationsView()));
                }),
            IconButton(
                icon: Icon(
                  EvaIcons.keypad,
                  color: primaryColor,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openEndDrawer();
                }),
          ],
        ),
        endDrawer: widget.drawer,
        body: IndexedStack(
          index: currentIndex,
          children: widget.homeItems,
        ),
        bottomNavigationBar: AnimatedBottomBar(
          items: barItems,
          itemTapped: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          cI: currentIndex,
        ));
  }
}
